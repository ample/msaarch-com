require 'test_helper'

class FeatureTest < ActiveSupport::TestCase

  should belong_to(:owner)
  should belong_to(:asset)

end
