require 'test_helper'

class ContactsTopicsControllerTest < ActionController::TestCase
  setup do
    @contacts_topic = contacts_topics(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contacts_topics)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contacts_topic" do
    assert_difference('ContactsTopic.count') do
      post :create, contacts_topic: { name: @contacts_topic.name }
    end

    assert_redirected_to contacts_topic_path(assigns(:contacts_topic))
  end

  test "should show contacts_topic" do
    get :show, id: @contacts_topic
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contacts_topic
    assert_response :success
  end

  test "should update contacts_topic" do
    patch :update, id: @contacts_topic, contacts_topic: { name: @contacts_topic.name }
    assert_redirected_to contacts_topic_path(assigns(:contacts_topic))
  end

  test "should destroy contacts_topic" do
    assert_difference('ContactsTopic.count', -1) do
      delete :destroy, id: @contacts_topic
    end

    assert_redirected_to contacts_topics_path
  end
end
