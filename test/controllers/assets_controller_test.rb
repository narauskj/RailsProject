require 'test_helper'

class AssetsControllerTest < ActionController::TestCase
  setup do
    @asset = assets(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:assets)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create asset" do
    assert_difference('Asset.count') do
      post :create, asset: { asset_tag: @asset.asset_tag, asset_type: @asset.asset_type, is_assigned: @asset.is_assigned, is_supported: @asset.is_supported, is_used: @asset.is_used, lifecycle: @asset.lifecycle, make: @asset.make, model: @asset.model, po: @asset.po, po_date: @asset.po_date, price: @asset.price, serial_nr: @asset.serial_nr }
    end

    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should show asset" do
    get :show, id: @asset
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @asset
    assert_response :success
  end

  test "should update asset" do
    patch :update, id: @asset, asset: { asset_tag: @asset.asset_tag, asset_type: @asset.asset_type, is_assigned: @asset.is_assigned, is_supported: @asset.is_supported, is_used: @asset.is_used, lifecycle: @asset.lifecycle, make: @asset.make, model: @asset.model, po: @asset.po, po_date: @asset.po_date, price: @asset.price, serial_nr: @asset.serial_nr }
    assert_redirected_to asset_path(assigns(:asset))
  end

  test "should destroy asset" do
    assert_difference('Asset.count', -1) do
      delete :destroy, id: @asset
    end

    assert_redirected_to assets_path
  end
end
