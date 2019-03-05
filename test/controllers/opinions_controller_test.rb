require 'test_helper'

class OpinionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @opinion = opinions(:one)
  end

  test "bad request, no query" do
    get opinions_url(:query)
    assert_response :bad_request
  end

  test "bad request, query is blank" do
    get opinions_url(:query), params: { query: "" }
    assert_response :bad_request
  end

  test "bad request, query is not a valid opinion url" do
    get opinions_url(:query), params: { query: "https://www.example.com" }
    assert_response :bad_request
  end

  test "valid opinion request" do
    get opinions_url(:query), params: { query: "https://www.debate.org/opinions/should-drug-users-be-put-in-prison" }
    assert_response :success
  end

  test "valid opinion request, response parsed" do
    get opinions_url(:query), params: { query: "https://www.debate.org/opinions/should-drug-users-be-put-in-prison" }
    json = JSON.parse(@response.body)
    assert_equal "Should drug users be put in prison?", json['opinion_name']
  end

end
