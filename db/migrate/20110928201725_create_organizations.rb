class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :title
      t.references :logo
      t.integer :created_by, :updated_by
      t.boolean :active
      t.timestamps
    end
    add_column :awards, :organization_id, :integer

    # seed organizations table
    ['AIA Cincinnati', 
     'American Subcontracters Association',
     'American School &amp; University',
     'ASLA',
     'Business Courier',
     'Downtown Council of the Cincinnati Chamber of Commerce',
     'Cincinnati Magazine',
     'Cincinnati Preservation Association',
     'Fire Chief Magazine',
     'Floor Focus Magazine',
     'GD USA Magazine',
     'IIDA Cincinnati/Dayton',
     'National Council for Interior Design Qualification',
     'Ohio Parks and Rec. Association',
     'SEGD',
     'Tri-State Masonry Institute'     
     ].each do |org|
      Organization.create :title => org, :active => true
    end

  end
end
