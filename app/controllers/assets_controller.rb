class AssetsController < ApplicationController
  before_action :set_asset, only: [:show, :edit, :update, :destroy, :group]

  # GET /assets
  # GET /assets.json
  def index
  	@q = Asset.ransack(params[:q])
  	@q.sorts = 'updated_at desc' if @q.sorts.empty?
  	@assets = @q.result(distinct: true).paginate(:page => params[:page], :per_page => 50)
  	#@assets = Asset.paginate(:page => params[:page], :per_page => 30)
    respond_to do |format|
     	format.html
     	format.csv { render text: @assets.to_csv }     	
    end 	
    @q.build_condition if @q.conditions.empty?
  	@q.build_sort if @q.sorts.empty? 
  end

  # GET /assets/1
  # GET /assets/1.json
  def show
  end

  # GET /assets/new
  def new
    @asset = Asset.new
    transfer = @asset.transfers.build
	
  end

  # GET /assets/1/edit
  def edit
  	
  end
  def search

  end
  
  def group

  end
  
  def import
      Asset.import(params[:file])
      redirect_to '/assets', notice: "Assets imported from CSV file"
  end
  	 
  # POST /assets
  # POST /assets.json
  def create
    @asset = Asset.new(asset_params)
	
    respond_to do |format|
      if @asset.save
        format.html { redirect_to @asset, notice: 'Asset was successfully created.' }
        format.json { render :show, status: :created, location: @asset }
      else
        format.html { render :new }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /assets/1
  # PATCH/PUT /assets/1.json
  def update
    respond_to do |format|
      if @asset.update(asset_params)
        format.html { redirect_to @asset, notice: 'Asset was successfully updated.' }
        format.json { render :show, status: :ok, location: @asset }
      else
        format.html { render :edit }
        format.json { render json: @asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /assets/1
  # DELETE /assets/1.json
  def destroy
    @asset.destroy
    respond_to do |format|
      format.html { redirect_to assets_url, notice: 'Asset was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_asset
      @asset = Asset.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def asset_params
      params.require(:asset).permit(:asset_type, :asset_tag, :serial_nr, :po, :po_date, :price, :lifecycle, :make, :model, :priority, transfers_attributes: [:date, :asset_id, :employee_id, :location_id, :room])
    end
    

end
