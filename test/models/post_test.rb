require 'test_helper'

class PostTest < ActiveSupport::TestCase
   def setup
     @post = Post.new(
       title:"example",
       content:"content",
       user_id: 1
     )
   end

   test "the truth" do
     assert true
   end
end
