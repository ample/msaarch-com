module Nesting augmentation do

  ###---------------------------------------------------- Scopes

  scope :root_level, where('parent_id IS NULL')

  ###---------------------------------------------------- Plugins

  acts_as_tree :order => 'sort_order ASC'

  ###---------------------------------------------------- Instance Methods

  # Used in the admin to display the parents of a page
  def hierarchy
    parent.nil? ? nav_name : "#{parent.hierarchy} > #{nav_name}"
  end

  # Used in the admin to add up the number of stops on the way to the root
  def parents_count
    parent.nil? ? 0 : parent.parents_count + 1
  end

  # Builds the full path to a page, used by public_page_path helper
  def hierarchy_permalink
    parent.nil? ? "/#{permalink}" : "#{parent.hierarchy_permalink}/#{permalink}"
  end

  ###---------------------------------------------------- Class Methods

  # Selects only the pages which are capable of bearing children
  def self.fit_parents
    all.select { |p| p.parents_count < 2 }
  end

  # Creates the select menu for a new page's parent
  def self.parent_select
    fit_parents.collect {|p| [ p.hierarchy, p.id ] }.sort { |x,y| x[0] <=> y[0] }
  end

end end
