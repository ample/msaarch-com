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

contact = Page.create :title => 'Contact', :active => true, :permalink => 'contact', :nav_name => 'Contact', :nav_position => 'header'
team = Page.create :title => 'Team', :active => true, :permalink => 'team', :nav_name => 'Team', :nav_position => 'header'
portfolio = Page.create :title => 'Portfolio', :active => true, :permalink => 'portfolio', :nav_name => 'Portfolio', :nav_position => 'header'
homepage = Page.create :title => 'Home', :active => true, :permalink => 'index', :nav_name => 'Home', :nav_position => 'header'

categories = Category.create([
  { :title => 'ECE-12', :active => true }, 
  { :title => 'Higher Education', :active => true }, 
  { :title => 'Professional', :active => true }, 
  { :title => 'Community', :active => true }, 
  { :title => 'Football', :active => true }, 
  { :title => 'Soccer', :active => true }, 
  { :title => 'Track', :active => true }, 
  { :title => 'Baseball/Softball', :active => true }, 
  { :title => 'Tennis', :active => true }, 
  { :title => 'Swimming/Diving', :active => true }, 
  { :title => 'Basketball', :active => true }, 
  { :title => 'New Construction', :active => true }, 
  { :title => 'Interior Renovation', :active => true }, 
  { :title => 'Exterior Renovation', :active => true }, 
  { :title => 'Expansion/Additions', :active => true }, 
  { :title => 'Master Plan', :active => true }, 
  { :title => 'Wayfinding/Env.', :active => true }, 
  { :title => 'Graphics', :active => true }, 
  { :title => 'Prototype', :active => true }, 
  { :title => 'Design/Rollout', :active => true }, 
  { :title => 'Feasability/Schematic', :active => true }, 
  { :title => 'Design', :active => true }, 
])

segments = Segment.create([
  { :title => 'MSA Sport', :nav_name => 'MSA Sport', :active => true, :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. Proin congue viverra enim, interdum accumsan velit condimentum in. Donec suscipit bibendum rutrum. Nullam justo tortor, aliquet a convallis id, vehicula placerat est. In porttitor pharetra nisi in tempus. Integer lacinia nunc risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id nisi sem, vitae tempus diam. Morbi velit arcu, fringilla egestas aliquet in, suscipit eu tortor. Maecenas odio magna, vehicula vel pharetra non, ultrices eget ligula. Cras id purus metus, sed gravida nibh. Aliquam molestie, orci sed ultricies sodales, velit mi pulvinar tellus, eget eleifend tortor dolor quis lorem. Aliquam orci urna, blandit eget tincidunt quis, venenatis at leo. Maecenas pharetra bibendum metus vel auctor.' }
])

projects = Project.create([
  { :title => 'Test Project', :nav_name => 'Test Project', :active => true, :segment => segments.first, :categories => [ categories.first, categories.last ] }
])