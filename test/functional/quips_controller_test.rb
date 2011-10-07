require 'test_helper'

class QuipsControllerTest < ActionController::TestCase
  setup do
    @quip = quips(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:quips)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create quip" do
    assert_difference('Quip.count') do
      post :create, quip: @quip.attributes
    end

    assert_redirected_to quip_path(assigns(:quip))
  end

  test "should show quip" do
    get :show, id: @quip.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @quip.to_param
    assert_response :success
  end

  test "should update quip" do
    put :update, id: @quip.to_param, quip: @quip.attributes
    assert_redirected_to quip_path(assigns(:quip))
  end

  test "should destroy quip" do
    assert_difference('Quip.count', -1) do
      delete :destroy, id: @quip.to_param
    end

    assert_redirected_to quips_path
  end
end
