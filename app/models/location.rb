class Location < ActiveRecord::Base
		has_many :transfers
		has_many :employees
		validates :country, presence:true
		validates :city, presence:true
		validates :site_code, presence:true
end
