class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :title
      t.string :event_type
      t.text :body
      t.references :asset
      t.datetime :event_date
      t.integer :sort_order, :default => 0
      t.boolean :active, :default => false
      t.datetime :active_at
      t.datetime :inactive_at
      t.timestamps
    end
    event_titles = ['Ut sed nunc nunc.', 'Proin rhoncus felis ac dui rutrum.', 'Duis euismod sapien sed nisl ornare nec vulputate nibh blandit. ', 'Vestibulum in lorem eget elit convallis commodo sed id purus.']
    event_types = ['msa', 'cincinnati', 'global']
    (1..20).each do |i|
      Event.create :event_date => "20" + rand(11).to_s.rjust(2, '0') + "-01-01", :title => event_titles[rand(event_titles.size)], :body => event_titles[rand(event_titles.size)], :active => true, :event_type => event_types[rand(event_types.size)]
    end
  end
end
