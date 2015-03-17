class Location < ActiveRecord::Base
		has_many :transfers
		has_many :employees
		validates :country, :city, :site_code, presence:true
		validates :site_code, uniqueness:true
end


