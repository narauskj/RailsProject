class ReportsController < ApplicationController
	def index
	
		@assets = Asset.all
    @transfers = Transfer.all
    @employees = Employee.all
    @locations = Location.all
    @data_value = Asset.joins("inner join transfers on transfers.asset_id = assets.id inner join locations on transfers.location_id = locations.id").select("assets.id, assets.po_date, assets.price, assets.lifecycle, max(locations.site_code) as site_code").group("assets.id, assets.po_date, assets.price, assets.lifecycle")
    @critical_assets = Asset.joins("inner join transfers on transfers.asset_id = assets.id inner join locations on transfers.location_id = locations.id").select("assets.asset_tag, assets.serial_nr, assets.po, assets.po_date, assets.lifecycle, assets.make, assets.model, max(locations.site_code) as site_code").group("assets.asset_tag, assets.serial_nr, assets.po, assets.po_date, assets.lifecycle, assets.make, assets.model").where("assets.priority = 'Critical'")

    @q = @assets.ransack(params[:q])
    @unique_assets = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 50)
		#code for showing aging assets per site
    @unasigned_assets = Asset.where("assets.id NOT IN (SELECT asset_id FROM transfers)")

	end	
	
	
end
