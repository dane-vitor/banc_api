require "test_helper"

class ExtractsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @extract = extracts(:one)
  end

  test "should get index" do
    get extracts_url, as: :json
    assert_response :success
  end

  test "should create extract" do
    assert_difference('Extract.count') do
      post extracts_url, params: { extract: { credit: @extract.credit, current_account: @extract.current_account, debit: @extract.debit, final_balance: @extract.final_balance, opening_balance: @extract.opening_balance } }, as: :json
    end

    assert_response 201
  end

  test "should show extract" do
    get extract_url(@extract), as: :json
    assert_response :success
  end

  test "should update extract" do
    patch extract_url(@extract), params: { extract: { credit: @extract.credit, current_account: @extract.current_account, debit: @extract.debit, final_balance: @extract.final_balance, opening_balance: @extract.opening_balance } }, as: :json
    assert_response 200
  end

  test "should destroy extract" do
    assert_difference('Extract.count', -1) do
      delete extract_url(@extract), as: :json
    end

    assert_response 204
  end
end
