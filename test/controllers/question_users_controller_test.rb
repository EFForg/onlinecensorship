require 'test_helper'

class QuestionUsersControllerTest < ActionController::TestCase
  setup do
    @question_user = question_users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:question_users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create question_user" do
    assert_difference('QuestionUser.count') do
      post :create, question_user: { country_id: @question_user.country_id, email: @question_user.email, name: @question_user.name }
    end

    assert_redirected_to question_user_path(assigns(:question_user))
  end

  test "should show question_user" do
    get :show, id: @question_user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @question_user
    assert_response :success
  end

  test "should update question_user" do
    patch :update, id: @question_user, question_user: { country_id: @question_user.country_id, email: @question_user.email, name: @question_user.name }
    assert_redirected_to question_user_path(assigns(:question_user))
  end

  test "should destroy question_user" do
    assert_difference('QuestionUser.count', -1) do
      delete :destroy, id: @question_user
    end

    assert_redirected_to question_users_path
  end
end
