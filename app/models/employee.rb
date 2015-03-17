class Employee < ActiveRecord::Base
	has_many :transfers
	belongs_to :location
	validates :name, :email, :location_id, presence:true
	validates :username, :email, uniqueness:true
	validates :location_id, numericality: { only_integer: true }
end

