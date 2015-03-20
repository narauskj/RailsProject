class RegisterController < ApplicationController
  	def index
  		@registry = Asset.all
  	end
   	
   	


end
