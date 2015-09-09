module Sorting augmentation do

  ###---------------------------------------------------- Scopes

  default_scope { order("#{table_name}.sort_order ASC") }

end end
