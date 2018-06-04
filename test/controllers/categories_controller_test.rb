require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = categories(:category_artisanal)
  end

  test 'should get index with web service support' do
    get categories_url, as: :json
    assert_equal 'application/json', request.content_type
    assert_equal 2, response.parsed_body.length
  end

  test 'should show a category with web service support' do
    get category_url(@category), as: :json
    assert_equal 'application/json', request.content_type
    %w(id name).each do |attribute|
      assert_equal @category.send(attribute), response.parsed_body[attribute]
    end
  end

  test 'should create category with web service support' do
    assert_difference 'Category.count' do
      post categories_url, params: {
        category: {
          name: 'Nerd Stuff'
        }
      }, as: :json
    end

    assert_equal 'application/json', request.content_type
    %w(id name).each do |attribute|
      assert response.parsed_body.key? attribute
    end
  end

  test 'should update category with web service support' do
    patch category_url(@category), params: {
      size: {
        name: 'Super Duper Shiny Red/Orange/Yellow'
      }
    }, as: :json

    assert_equal 'application/json', request.content_type
    @category.reload
    %w(id name).each do |attribute|
      assert_equal @category.send(attribute), response.parsed_body[attribute]
    end
  end

  test "should destroy category with web service support" do
    size = categories(:category_sports)
    assert_difference('Category.count', -1) do
      delete category_url(size), as: :json
    end

    assert_equal 'application/json', request.content_type
    assert_response :success
  end
end
