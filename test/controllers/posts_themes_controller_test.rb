require 'test_helper'

class PostsThemesControllerTest < ActionController::TestCase
  setup do
    @posts_theme = posts_themes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:posts_themes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create posts_theme" do
    assert_difference('PostsTheme.count') do
      post :create, posts_theme: { title: @posts_theme.title }
    end

    assert_redirected_to posts_theme_path(assigns(:posts_theme))
  end

  test "should show posts_theme" do
    get :show, id: @posts_theme
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @posts_theme
    assert_response :success
  end

  test "should update posts_theme" do
    patch :update, id: @posts_theme, posts_theme: { title: @posts_theme.title }
    assert_redirected_to posts_theme_path(assigns(:posts_theme))
  end

  test "should destroy posts_theme" do
    assert_difference('PostsTheme.count', -1) do
      delete :destroy, id: @posts_theme
    end

    assert_redirected_to posts_themes_path
  end
end
