class Employee < ActiveRecord::Base
	has_many :transfers
	belongs_to :location
	validates :name, presence:true
	validates :email, presence:true
	validates :location_id, presence:true,  numericality: { only_integer: true }
end
