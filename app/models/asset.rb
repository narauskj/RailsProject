class Asset < ActiveRecord::Base
	has_many :transfers
	accepts_nested_attributes_for :transfers
	validates :asset_type, :asset_tag, :serial_nr, :make, :model, presence:true
	validates :asset_tag, :serial_nr, uniqueness:true
	validates :price, numericality: {greater_than_or_equal_to: 0.01}
	validates :lifecycle, numericality: { only_integer: true }
	
	
		
	ASSET_TYPES = ['Laptop','Desktop','Server','Monitor','UPS','Battery','Switch']
	LIFECYLE_MONTHS = ['12','24','36','48']
	
	def value
		if self.price? & self.lifecycle?
			((1-(((Time.now.year * 12 + Time.now.month)-(self.po_date.year * 12 + self.po_date.month)).to_f/self.lifecycle.to_i))*self.price.to_f).round(2)
		else	
		    '0'
		end
	end	
	def self.assignable_items
		all
	end		
end
