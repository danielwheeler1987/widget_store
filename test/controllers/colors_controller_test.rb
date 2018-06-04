require 'test_helper'

class ColorsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @color = colors(:color_black)
  end

  test 'should get index with web service support' do
    get colors_url, as: :json
    assert_equal 'application/json', request.content_type
    assert_equal 3, response.parsed_body.length
  end

  test 'should show a color with web service support' do
    get color_url(@color), as: :json
    assert_equal 'application/json', request.content_type
    %w(id name).each do |attribute|
      assert_equal @color.send(attribute), response.parsed_body[attribute]
    end
  end

  test 'should create color with web service support' do
    assert_difference 'Color.count' do
      post colors_url, params: {
        color: {
          name: 'Super Shiny Red/Orange'
        }
      }, as: :json
    end

    assert_equal 'application/json', request.content_type
    %w(id name).each do |attribute|
      assert response.parsed_body.key? attribute
    end
  end

  test 'should update color with web service support' do
    patch color_url(@color), params: {
      color: {
        name: 'Super Duper Shiny Red/Orange/Yellow'
      }
    }, as: :json

    assert_equal 'application/json', request.content_type
    @color.reload
    %w(id name).each do |attribute|
      assert_equal @color.send(attribute), response.parsed_body[attribute]
    end
  end

  test "should destroy color with web service support" do
    size = colors(:color_red)
    assert_difference('Color.count', -1) do
      delete color_url(size), as: :json
    end

    assert_equal 'application/json', request.content_type
    assert_response :success
  end
end
