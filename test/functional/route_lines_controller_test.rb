require 'test_helper'

class RouteLinesControllerTest < ActionController::TestCase
  setup do
    @route_line = route_lines(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:route_lines)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create route_line" do
    assert_difference('RouteLine.count') do
      post :create, :route_line => @route_line.attributes
    end

    assert_redirected_to route_line_path(assigns(:route_line))
  end

  test "should show route_line" do
    get :show, :id => @route_line.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @route_line.to_param
    assert_response :success
  end

  test "should update route_line" do
    put :update, :id => @route_line.to_param, :route_line => @route_line.attributes
    assert_redirected_to route_line_path(assigns(:route_line))
  end

  test "should destroy route_line" do
    assert_difference('RouteLine.count', -1) do
      delete :destroy, :id => @route_line.to_param
    end

    assert_redirected_to route_lines_path
  end
end
