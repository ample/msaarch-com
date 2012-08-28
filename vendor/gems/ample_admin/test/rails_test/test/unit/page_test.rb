require 'test_helper'

class PageTest < ActiveSupport::TestCase

  should have_many(:features)
  should have_many(:blocks)

  should validate_presence_of(:title)
  should validate_presence_of(:nav_name)

end
