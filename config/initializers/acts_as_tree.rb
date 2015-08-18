require File.join(Rails.root, 'lib/acts_as_tree/active_record/acts/tree')

ActiveRecord::Base.send :include, ActiveRecord::Acts::Tree
