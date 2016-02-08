require 'test_helper'

class VoteartistsControllerTest < ActionController::TestCase
  setup do
    @voteartist = voteartists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voteartists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create voteartist" do
    assert_difference('Voteartist.count') do
      post :create, voteartist: { amount_paid: @voteartist.amount_paid, artist_id: @voteartist.artist_id, country_id: @voteartist.country_id, integer: @voteartist.integer, user_id: @voteartist.user_id }
    end

    assert_redirected_to voteartist_path(assigns(:voteartist))
  end

  test "should show voteartist" do
    get :show, id: @voteartist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @voteartist
    assert_response :success
  end

  test "should update voteartist" do
    patch :update, id: @voteartist, voteartist: { amount_paid: @voteartist.amount_paid, artist_id: @voteartist.artist_id, country_id: @voteartist.country_id, integer: @voteartist.integer, user_id: @voteartist.user_id }
    assert_redirected_to voteartist_path(assigns(:voteartist))
  end

  test "should destroy voteartist" do
    assert_difference('Voteartist.count', -1) do
      delete :destroy, id: @voteartist
    end

    assert_redirected_to voteartists_path
  end
end
