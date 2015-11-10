require 'test_helper'

class HomeFieldsControllerTest < ActionController::TestCase
  setup do
    @home_field = home_fields(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:home_fields)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create home_field" do
    assert_difference('HomeField.count') do
      post :create, home_field: { appeal_btn_text: @home_field.appeal_btn_text, appeal_text: @home_field.appeal_text, slogan: @home_field.slogan, what_oc_text: @home_field.what_oc_text, what_oc_title: @home_field.what_oc_title }
    end

    assert_redirected_to home_field_path(assigns(:home_field))
  end

  test "should show home_field" do
    get :show, id: @home_field
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @home_field
    assert_response :success
  end

  test "should update home_field" do
    patch :update, id: @home_field, home_field: { appeal_btn_text: @home_field.appeal_btn_text, appeal_text: @home_field.appeal_text, slogan: @home_field.slogan, what_oc_text: @home_field.what_oc_text, what_oc_title: @home_field.what_oc_title }
    assert_redirected_to home_field_path(assigns(:home_field))
  end

  test "should destroy home_field" do
    assert_difference('HomeField.count', -1) do
      delete :destroy, id: @home_field
    end

    assert_redirected_to home_fields_path
  end
end
