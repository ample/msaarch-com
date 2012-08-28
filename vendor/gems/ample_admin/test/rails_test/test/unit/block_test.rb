require 'test_helper'

class BlockTest < ActiveSupport::TestCase

  should belong_to(:page)
  should belong_to(:asset)

end
