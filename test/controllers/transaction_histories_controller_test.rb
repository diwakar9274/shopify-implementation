# frozen_string_literal: true

require 'test_helper'

class TransactionHistoriesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get transaction_histories_index_url
    assert_response :success
  end
end
