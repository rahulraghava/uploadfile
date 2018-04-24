require 'test_helper'

class AdvertismentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advertisment = advertisments(:one)
  end

  test "should get index" do
    get advertisments_url
    assert_response :success
  end

  test "should get new" do
    get new_advertisment_url
    assert_response :success
  end

  test "should create advertisment" do
    assert_difference('Advertisment.count') do
      post advertisments_url, params: { advertisment: { brand_id: @advertisment.brand_id, color: @advertisment.color, fueltype: @advertisment.fueltype, kmdriven: @advertisment.kmdriven, ownercount: @advertisment.ownercount, price: @advertisment.price, user_id: @advertisment.user_id, variant_id: @advertisment.variant_id, year: @advertisment.year } }
    end

    assert_redirected_to advertisment_url(Advertisment.last)
  end

  test "should show advertisment" do
    get advertisment_url(@advertisment)
    assert_response :success
  end

  test "should get edit" do
    get edit_advertisment_url(@advertisment)
    assert_response :success
  end

  test "should update advertisment" do
    patch advertisment_url(@advertisment), params: { advertisment: { brand_id: @advertisment.brand_id, color: @advertisment.color, fueltype: @advertisment.fueltype, kmdriven: @advertisment.kmdriven, ownercount: @advertisment.ownercount, price: @advertisment.price, user_id: @advertisment.user_id, variant_id: @advertisment.variant_id, year: @advertisment.year } }
    assert_redirected_to advertisment_url(@advertisment)
  end

  test "should destroy advertisment" do
    assert_difference('Advertisment.count', -1) do
      delete advertisment_url(@advertisment)
    end

    assert_redirected_to advertisments_url
  end
end
