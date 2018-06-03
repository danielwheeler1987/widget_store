require 'test_helper'

class WidgetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @widget = widgets(:widget_one)
  end

  test "should get index" do
    #byebug
    get widgets_url
    assert_response :success
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

  test "should show widget" do
    get widget_url(@widget)
    assert_response :success
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

  test "should destroy widget" do
    assert_difference('Widget.count', -1) do
      delete widget_url(@widget)
    end

    assert_redirected_to widgets_url
    assert_equal flash[:notice], 'Great! Widget was successfully destroyed.'
  end
end
