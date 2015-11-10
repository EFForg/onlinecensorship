require 'test_helper'

class UploadedFilesControllerTest < ActionController::TestCase
  setup do
    @uploaded_file = uploaded_files(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:uploaded_files)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create uploaded_file" do
    assert_difference('UploadedFile.count') do
      post :create, uploaded_file: { question_answer_id: @uploaded_file.question_answer_id, title: @uploaded_file.title }
    end

    assert_redirected_to uploaded_file_path(assigns(:uploaded_file))
  end

  test "should show uploaded_file" do
    get :show, id: @uploaded_file
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @uploaded_file
    assert_response :success
  end

  test "should update uploaded_file" do
    patch :update, id: @uploaded_file, uploaded_file: { question_answer_id: @uploaded_file.question_answer_id, title: @uploaded_file.title }
    assert_redirected_to uploaded_file_path(assigns(:uploaded_file))
  end

  test "should destroy uploaded_file" do
    assert_difference('UploadedFile.count', -1) do
      delete :destroy, id: @uploaded_file
    end

    assert_redirected_to uploaded_files_path
  end
end
