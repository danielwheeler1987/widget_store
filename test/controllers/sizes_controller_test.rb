require 'test_helper'

class SizesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @size = sizes(:size_large)
  end

  test 'should get index with web service support' do
    get sizes_url, as: :json
    assert_equal 'application/json', request.content_type
    assert_equal 3, response.parsed_body.length
  end

  test 'should show a size with web service support' do
    get size_url(@size), as: :json
    assert_equal 'application/json', request.content_type
    %w(id name).each do |attribute|
      assert_equal @size.send(attribute), response.parsed_body[attribute]
    end
  end

  test 'should create size with web service support' do
    assert_difference 'Size.count' do
      post sizes_url, params: {
        size: {
          name: 'the largest size in the world'
        }
      }, as: :json
    end

    assert_equal 'application/json', request.content_type
    %w(id name).each do |attribute|
      assert response.parsed_body.key? attribute
    end
  end

  test 'should update size with web service support' do
    patch size_url(@size), params: {
      size: {
        name: 'the smallest size in the world'
      }
    }, as: :json

    assert_equal 'application/json', request.content_type
    @size.reload
    %w(id name).each do |attribute|
      assert_equal @size.send(attribute), response.parsed_body[attribute]
    end
  end

  test "should destroy size with web service support" do
    size = sizes(:size_small)
    assert_difference('Size.count', -1) do
      delete size_url(size), as: :json
    end

    assert_equal 'application/json', request.content_type
    assert_response :success
  end
end
