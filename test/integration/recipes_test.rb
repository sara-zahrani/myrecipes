require 'test_helper'

class RecipesTest < ActionDispatch::IntegrationTest

  def setup
    @chef = Chef.create!(chefname: "Sara", email: "sara@email.com")
    @recipe = Recipe.create!(name: "Soup", description: "Great soup! you must try it out.", chef: @chef)
    @recipe2 = @chef.recipes.build(name: "Sweets", description: "coco sweets. Perfect for snacks")
    @recipe2.save
  end

  test "should get recipes index" do
    get recipes_url
    assert_response :success
  end

  test "should get recipes listing" do
    get recipes_url
    assert_template 'recipes/index'
    assert_select "a[href=?]", recipe_url(@recipe), text: @recipe.name
    assert_select "a[href=?]", recipe_url(@recipe2), text: @recipe2.name

  end

  test "should get recipes show" do
    get recipe_url(@recipe)
    assert_template 'recipes/show'
    assert_match @recipe.name, response.body
    assert_match @recipe.description, response.body
    assert_match @chef.chefname, response.body
  end


end
