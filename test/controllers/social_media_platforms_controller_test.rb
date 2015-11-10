require 'test_helper'

class SocialMediaPlatformsControllerTest < ActionController::TestCase
  setup do
    @social_media_platform = social_media_platforms(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:social_media_platforms)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create social_media_platform" do
    assert_difference('SocialMediaPlatform.count') do
      post :create, social_media_platform: { title: @social_media_platform.title }
    end

    assert_redirected_to social_media_platform_path(assigns(:social_media_platform))
  end

  test "should show social_media_platform" do
    get :show, id: @social_media_platform
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @social_media_platform
    assert_response :success
  end

  test "should update social_media_platform" do
    patch :update, id: @social_media_platform, social_media_platform: { title: @social_media_platform.title }
    assert_redirected_to social_media_platform_path(assigns(:social_media_platform))
  end

  test "should destroy social_media_platform" do
    assert_difference('SocialMediaPlatform.count', -1) do
      delete :destroy, id: @social_media_platform
    end

    assert_redirected_to social_media_platforms_path
  end
end
