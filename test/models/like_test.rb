require 'test_helper'

class LikeTest < ActiveSupport::TestCase
  def setup
    @like = Like.new(user_id:1, post_id:1)
  end

   test "the truth" do
     assert @like.valid?
   end
end
