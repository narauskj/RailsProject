class Employee < ActiveRecord::Base
	has_many :transfers
	accepts_nested_attributes_for :transfers
	belongs_to :location
	validates :name, :email, :location_id, presence:true
	validates :username, :email, uniqueness:true
	validates :location_id, numericality: { only_integer: true }
	
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
		Employee.create! row.to_hash			
		end
	end	
end

