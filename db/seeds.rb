# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([
  { name: 'Taylor MacDonald', email: 'taylor@helloample.com', password: 'ample2011', password_confirmation: 'ample2011', :admin => true },
  { name: 'Bobby Uhlenbrock', email: 'bobby@helloample.com', password: 'ample2011', password_confirmation: 'ample2011', :admin => true },
  { name: 'Ryan Merrill', email: 'ryan@helloample.com', password: 'ample2011', password_confirmation: 'ample2011', :admin => true }
])

homepage = Page.create :title => 'Home', :active => true, :permalink => 'index', :nav_name => 'Home'
contact = Page.create :title => 'Contact', :active => true, :permalink => 'contact', :nav_name => 'Contact'
team = Page.create :title => 'Team', :active => true, :permalink => 'team', :nav_name => 'Team'