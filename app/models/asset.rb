class Asset < ActiveRecord::Base
	has_many :transfers, :dependent => :destroy
	accepts_nested_attributes_for :transfers
	validates :asset_type, :asset_tag, :serial_nr, :make, :model, presence:true
	validates :asset_tag, :serial_nr, uniqueness:true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :lifecycle, numericality: { only_integer: true }
	
	
		
	ASSET_TYPES = ['Laptop','Desktop','Server','Monitor','UPS','Battery','Switch']
	LIFECYLE_MONTHS = ['12','24','36','48','60','72']
	PRIORITY_LEVELS = ['Normal','High','Critical']
	
	def value
		if self.po_date? & self.price? & self.lifecycle?
			((1-(((Time.now.year * 12 + Time.now.month)-(self.po_date.year * 12 + self.po_date.month)).to_f/self.lifecycle.to_i))*self.price.to_f).round(2)
		else	
		    '0'
		end
	end	
	
	def assigned
		link = Transfers.find_by asset_id: self.id
		if link?
			true
		else
			false
		end	
	end
	
	def self.to_csv
		CSV.generate do |csv|
			csv << column_names
			all.each do |item|
				csv << item.attributes.values
			end
		end		
	end
	
	def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
		Asset.create! row.to_hash			
		end
	end		


end
