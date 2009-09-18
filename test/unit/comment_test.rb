require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  context "A comment must have a title and body" do
    setup do
      @comment = Factory(:comment)
    end
    should_validate_presence_of :post_id
    should_validate_presence_of :author
    should_validate_presence_of :body
  end
end
