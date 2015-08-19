module Publishing augmentation do

  ###---------------------------------------------------- Scopes

  scope :live, lambda  { where(live_conditions) }
  scope :active, lambda { where("#{table_name}.active = ?", true) }

  ###---------------------------------------------------- Associations

  belongs_to :created_by, :class_name => 'User', :foreign_key => 'created_by'
  belongs_to :updated_by, :class_name => 'User', :foreign_key => 'updated_by'

  ###---------------------------------------------------- Validations

  # validates_format_of :active_at, :allow_blank => true
  # validates_format_of :inactive_at, :allow_blank => true
  
  ###---------------------------------------------------- Instance Methods

  def admin_status_class
    (active ? 'active' : 'inactive')
  end

  def live?
    active && (active_at.blank? || active_at < Time.zone.now) && (inactive_at.blank? || inactive_at > Time.zone.now)
  end

  ###---------------------------------------------------- Class Methods

  def self.live_conditions
    ["(#{table_name}.active_at IS NULL OR #{table_name}.active_at < ?) AND (#{table_name}.inactive_at IS NULL OR #{table_name}.inactive_at > ?) AND (#{table_name}.active = ?)", 
      Time.zone.now.to_s(:db), 
      Time.zone.now.to_s(:db),
      true]
  end

end end
