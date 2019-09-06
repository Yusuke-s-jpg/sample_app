require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(
      name:"example",
      email:"example"
    )
  end

  test "should be valid" do
     assert_not @user.valid?
  end
end
