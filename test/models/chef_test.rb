require "test_helper"

class ChefTest < ActiveSupport:: TestCase
  
  def setup
    @chef = Chef.new(chefname: "john", email: "john@example.com")     #create chef object
  end
  
  test "chef should be valid" do
    assert @chef.valid?
  end
  
  test "chef name should be present" do
    @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chef name should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end
  
  test "chef name should not be too short" do
    @chef.chefname = "aa"
    assert_not @chef.valid?
  end
  
  test "email must be present" do
    @chef.email = " "
    assert_not @chef.valid?
  end
  
  test "email length should be within bounds" do
    @chef.email = "a" * 101 + "@example.com"
    assert_not @chef.valid?
  end
  
  test "email address should be unique" do
    dup_chef = @chef.dup                    #assign local variable to duplicate chef object
    dup_chef.email = @chef.email.upcase     #makes sure that there is NO case sensitivity
    @chef.save                              #saves chef object
    assert_not dup_chef.valid?             #checks whether in memory variable is valid or not
  end
  
  test "email validation should accept valid addresses" do      #test checks for valid addresses
    valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eem.au laura+joe@monk.cm]                        #rails method that separates text within[] to different elements in an array. All emails given are valid.
    valid_addresses.each do |va|      #.each method iterates through a given array in rails. Several ways to do this. Each valid addresses element(email) is assigned to 'va'.
    @chef.email = va                 #not really sure what the rest of the code does. Check later if still unsure.
    assert @chef.valid?, '#{va.inspect} should be valid'#.inspect method will return whichever email format in the array that matches the one that is given by user(chef) and displays it in a string.
    end
  end
  
  test "email validation should reject invalid addresses" do    #test rejects invalid addresses
    invalid_addresses = %w[user@example,com user_at_eee.org user.name@example. eee@i_am_.co foo@ee+aar.com]
    invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be invalid'
    end
  end
end #end class

