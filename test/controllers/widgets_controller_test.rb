require 'test_helper'

class WidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @widget = widgets(:widget_one)
  end

  test "should get index" do
    get widgets_url
    assert_response :success
  end

  test "should get index with web service support" do
    get widgets_url, as: :json
    assert_equal 'application/json', request.content_type
    assert_equal 1, response.parsed_body.length
  end

  test "should get new" do
    get new_widget_url
    assert_response :success
  end

  test "should create widget" do
    assert_difference('Widget.count') do
      post widgets_url, params: {
        widget: {
          name: Faker::Hipster.unique.word,
          quantity: Faker::Number.non_zero_digit,
          color_id: Color.first.id,
          size_id: Size.first.id,
          category_id: Category.first.id
        }
      }
    end

    assert_redirected_to widgets_url
    assert_equal flash[:notice], 'Great! Widget was successfully created.'
  end

  test "should create widget with web service support" do
    assert_difference('Widget.count') do
      post widgets_url, params: {
        widget: {
          name: Faker::Hipster.unique.word,
          quantity: Faker::Number.non_zero_digit,
          color_id: Color.first.id,
          size_id: Size.first.id,
          category_id: Category.first.id
        }
      }, as: :json
    end

    assert_equal 'application/json', request.content_type
    %w(id name quantity color_id size_id category_id).each do |attribute|
      assert response.parsed_body.key? attribute
    end
  end

  test "should show widget" do
    get widget_url(@widget)
    assert_response :success
  end

  test "should show a widget with web service support" do
    get widget_url(@widget), as: :json
    assert_equal 'application/json', request.content_type
    %w(id name quantity color_id size_id category_id).each do |attribute|
      assert_equal @widget.send(attribute), response.parsed_body[attribute]
    end
  end

  test "should get edit" do
    get edit_widget_url(@widget)
    assert_response :success
  end

  test "should update widget" do
    patch widget_url(@widget), params: {
      widget: {
        name: Faker::Hipster.unique.word,
          quantity: Faker::Number.non_zero_digit,
          color_id: Color.first.id,
          size_id: Size.first.id,
          category_id: Category.first.id
      }
    }

    assert_redirected_to widgets_url
    assert_equal flash[:notice], 'Great! Widget was successfully updated.'
  end

  test "should update widget with web service support" do
    patch widget_url(@widget), params: {
      widget: {
        name: Faker::Hipster.unique.word,
          quantity: Faker::Number.non_zero_digit,
          color_id: Color.first.id,
          size_id: Size.first.id,
          category_id: Category.first.id
      }
    }, as: :json

    assert_equal 'application/json', request.content_type
    @widget.reload
    %w(id name quantity color_id size_id category_id).each do |attribute|
      assert_equal @widget.send(attribute), response.parsed_body[attribute]
    end
  end

  test "should destroy widget" do
    assert_difference('Widget.count', -1) do
      delete widget_url(@widget)
    end

    assert_redirected_to widgets_url
    assert_equal flash[:notice], 'Great! Widget was successfully destroyed.'
  end

  test "should destroy widget with web service support" do
    assert_difference('Widget.count', -1) do
      delete widget_url(@widget), as: :json
    end

    assert_equal 'application/json', request.content_type
    assert_response :success
  end
end
