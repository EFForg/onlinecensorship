require 'test_helper'

class FurtherReadsControllerTest < ActionController::TestCase
  setup do
    @further_read = further_reads(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:further_reads)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create further_read" do
    assert_difference('FurtherRead.count') do
      post :create, further_read: { content: @further_read.content, photo: @further_read.photo, title: @further_read.title }
    end

    assert_redirected_to further_read_path(assigns(:further_read))
  end

  test "should show further_read" do
    get :show, id: @further_read
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @further_read
    assert_response :success
  end

  test "should update further_read" do
    patch :update, id: @further_read, further_read: { content: @further_read.content, photo: @further_read.photo, title: @further_read.title }
    assert_redirected_to further_read_path(assigns(:further_read))
  end

  test "should destroy further_read" do
    assert_difference('FurtherRead.count', -1) do
      delete :destroy, id: @further_read
    end

    assert_redirected_to further_reads_path
  end
end
