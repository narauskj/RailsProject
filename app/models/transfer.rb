class Transfer < ActiveRecord::Base
	belongs_to :asset
	belongs_to :location
    belongs_to :employee 
    validates :asset_id, presence:true,  numericality: { only_integer: true }
    validates :employee_id, presence:true,  numericality: { only_integer: true }
    validates :location_id, presence:true,  numericality: { only_integer: true }
end
