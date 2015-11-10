require 'test_helper'

class SubscribesControllerTest < ActionController::TestCase
  setup do
    @subscribe = subscribes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:subscribes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create subscribe" do
    assert_difference('Subscribe.count') do
      post :create, subscribe: { email: @subscribe.email }
    end

    assert_redirected_to subscribe_path(assigns(:subscribe))
  end

  test "should show subscribe" do
    get :show, id: @subscribe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @subscribe
    assert_response :success
  end

  test "should update subscribe" do
    patch :update, id: @subscribe, subscribe: { email: @subscribe.email }
    assert_redirected_to subscribe_path(assigns(:subscribe))
  end

  test "should destroy subscribe" do
    assert_difference('Subscribe.count', -1) do
      delete :destroy, id: @subscribe
    end

    assert_redirected_to subscribes_path
  end
end
