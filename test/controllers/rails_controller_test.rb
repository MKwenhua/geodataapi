require 'test_helper'

class RailsControllerTest < ActionController::TestCase
  setup do
    @rail = rails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:rails)
  end

  test "should create rail" do
    assert_difference('Rail.count') do
      post :create, rail: { g: @rail.g, places: @rail.places, resource: @rail.resource }
    end

    assert_response 201
  end

  test "should show rail" do
    get :show, id: @rail
    assert_response :success
  end

  test "should update rail" do
    put :update, id: @rail, rail: { g: @rail.g, places: @rail.places, resource: @rail.resource }
    assert_response 204
  end

  test "should destroy rail" do
    assert_difference('Rail.count', -1) do
      delete :destroy, id: @rail
    end

    assert_response 204
  end
end
