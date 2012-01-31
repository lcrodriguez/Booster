require 'test_helper'

class VisitdetailsControllerTest < ActionController::TestCase
  setup do
    @visitdetail = visitdetails(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:visitdetails)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create visitdetail" do
    assert_difference('Visitdetail.count') do
      post :create, :visitdetail => @visitdetail.attributes
    end

    assert_redirected_to visitdetail_path(assigns(:visitdetail))
  end

  test "should show visitdetail" do
    get :show, :id => @visitdetail.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @visitdetail.to_param
    assert_response :success
  end

  test "should update visitdetail" do
    put :update, :id => @visitdetail.to_param, :visitdetail => @visitdetail.attributes
    assert_redirected_to visitdetail_path(assigns(:visitdetail))
  end

  test "should destroy visitdetail" do
    assert_difference('Visitdetail.count', -1) do
      delete :destroy, :id => @visitdetail.to_param
    end

    assert_redirected_to visitdetails_path
  end
end
