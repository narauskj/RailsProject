class Transfer < ActiveRecord::Base
	
	belongs_to :asset
	belongs_to :location
    belongs_to :employee 
    validates :asset_id, :employee_id, :location_id, presence:true
    validates :asset_id, :employee_id, :location_id, numericality: { only_integer:true }
    
    def self.import(file)
		CSV.foreach(file.path, headers: true) do |row|
		Transfer.create! row.to_hash			
		end
	end	
end


