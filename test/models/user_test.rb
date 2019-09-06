require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      name:"example",
      email:"example",
      password:"example",
      image_name:"example"
    )
  end

  test "should be valid" do
     assert_not @user.valid?
  end
end
