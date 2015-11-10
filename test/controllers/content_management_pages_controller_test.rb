require 'test_helper'

class ContentManagementPagesControllerTest < ActionController::TestCase
  setup do
    @content_management_page = content_management_pages(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:content_management_pages)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create content_management_page" do
    assert_difference('ContentManagementPage.count') do
      post :create, content_management_page: { content: @content_management_page.content, page: @content_management_page.page }
    end

    assert_redirected_to content_management_page_path(assigns(:content_management_page))
  end

  test "should show content_management_page" do
    get :show, id: @content_management_page
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @content_management_page
    assert_response :success
  end

  test "should update content_management_page" do
    patch :update, id: @content_management_page, content_management_page: { content: @content_management_page.content, page: @content_management_page.page }
    assert_redirected_to content_management_page_path(assigns(:content_management_page))
  end

  test "should destroy content_management_page" do
    assert_difference('ContentManagementPage.count', -1) do
      delete :destroy, id: @content_management_page
    end

    assert_redirected_to content_management_pages_path
  end
end
