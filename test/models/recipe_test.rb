require "test_helper"

class RecipeTest < ActiveSupport::TestCase
  
  def setup
    @chef = Chef.create(chefname: "bob", email: "bob@example.com")                                                        #create a test recipe object
    @recipe = @chef.recipes.build(name: "chicken parm", summary: "this is the best chicken parm recipe ever",             #with one to many association established, assign recipes to chef.build method
        description: "heat oil, add onions, add tomato sauce, add chicken, cook for 20 minutes")                          #because every recipe in application will be created ONLY by a chef using .build method
  end
  
  test "recipe should be valid" do
    assert @recipe.valid?
  end
  
  test "chef_id should be present" do
    @recipe.chef_id = nil                               #makes the test chef id become empty
    assert_not @recipe.valid?                           #assert that this will not be a valid condition
  end
  
  test "name should be present" do
    @recipe.name = ' '
    assert_not @recipe.valid?
  end
  
  test "name length should not be too long" do
    @recipe.name = "a" * 101
    assert_not @recipe.valid?
  end
  
  test "name length should not be too short" do
    @recipe.name = "aaaa"
    assert_not @recipe.valid?
  end
  
  test "summary should be present" do
    @recipe.summary = " "
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too long" do
    @recipe.summary = "a" * 151
    assert_not @recipe.valid?
  end
  
  test "summary length should not be too short" do
    @recipe.summary = "a" * 9
    assert_not @recipe.valid?
  end
  
  test "description must be present" do
    @recipe.description = " "
    assert_not @recipe.valid?
  end
  
  test "description should not be too long" do
    @recipe.description = "a" * 501
    assert_not @recipe.valid?
  end
  
  test "description should not be too short" do
    @recipe.description = "a" * 19
    assert_not @recipe.valid?
  end
end