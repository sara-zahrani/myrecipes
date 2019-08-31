require 'test_helper'

class RecipeTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.create!(chefname: "Sara", email: "sara@example.com")
    @recipe = @chef.recipes.build(name: "food", description: "great food hjb jdb jfd j jf")
  end

  test "recipe without chef should be invalide" do
    @recipe.chef_id = nil
    assert_not @recipe.valid?
  end

  test "Recipe should be valide" do
    assert @recipe.valid?
  end

  test "name should be present" do
    @recipe.name = ""
    assert_not @recipe.valid?
  end

  test "description should be present" do
    @recipe.description = ""
    assert_not @recipe.valid?
  end

  test "description shouldn't be less than 5 characters" do
    @recipe.description = "a" * 3
    assert_not @recipe.valid?
  end


  test "description shouldn't be more than 500 characters" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
end
