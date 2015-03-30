class ReportsController < ApplicationController
	def index
	
		@assets = Asset.all
    @transfers = Transfer.all
    @employees = Employee.all
    @locations = Location.all
    @data_value = Asset.joins("inner join transfers on transfers.asset_id = assets.id inner join locations on transfers.location_id = locations.id").select("assets.id, assets.po_date, assets.price, assets.lifecycle, max(locations.site_code) as site_code").group("assets.id, assets.po_date, assets.price, assets.lifecycle")
		@all_transfers = Transfer.joins("inner join assets on assets.id = transfers.asset_id inner join employees on employees.id = transfers.employee_id inner join locations on locations.id = transfers.location_id").select("assets.*, employees.*, locations.*, transfers.*")

    @test_set = Asset.joins(:transfers).select("DISTINCT assets.id, assets.asset_tag, MAX(transfers.location_id)")

    @q = @all_transfers.ransack(params[:q])
    @unique_assets = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 50)
		#code for showing aging assets per site 

	end	
	
	
end
