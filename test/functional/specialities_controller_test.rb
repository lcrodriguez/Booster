require 'test_helper'

class SpecialitiesControllerTest < ActionController::TestCase
  setup do
    @speciality = specialities(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:specialities)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create speciality" do
    assert_difference('Speciality.count') do
      post :create, :speciality => @speciality.attributes
    end

    assert_redirected_to speciality_path(assigns(:speciality))
  end

  test "should show speciality" do
    get :show, :id => @speciality.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @speciality.to_param
    assert_response :success
  end

  test "should update speciality" do
    put :update, :id => @speciality.to_param, :speciality => @speciality.attributes
    assert_redirected_to speciality_path(assigns(:speciality))
  end

  test "should destroy speciality" do
    assert_difference('Speciality.count', -1) do
      delete :destroy, :id => @speciality.to_param
    end

    assert_redirected_to specialities_path
  end
end
