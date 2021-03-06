require "test_helper"

class WithdrawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @withdraw = withdraws(:one)
  end

  test "should get index" do
    get withdraws_url, as: :json
    assert_response :success
  end

  test "should create withdraw" do
    assert_difference('Withdraw.count') do
      post withdraws_url, params: { withdraw: { current_account: @withdraw.current_account, withdraw: @withdraw.withdraw } }, as: :json
    end

    assert_response 201
  end

  test "should show withdraw" do
    get withdraw_url(@withdraw), as: :json
    assert_response :success
  end

  test "should update withdraw" do
    patch withdraw_url(@withdraw), params: { withdraw: { current_account: @withdraw.current_account, withdraw: @withdraw.withdraw } }, as: :json
    assert_response 200
  end

  test "should destroy withdraw" do
    assert_difference('Withdraw.count', -1) do
      delete withdraw_url(@withdraw), as: :json
    end

    assert_response 204
  end
end
