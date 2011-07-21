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

groups = Group.create([
  { :title => 'Sports', :active => true }, 
  { :title => 'Construction', :active => true }, 
  { :title => 'Other', :active => true }, 
])

categories = Category.create([
  { :title => 'ECE-12', :active => true, :groups => [ groups.last ] }, 
  { :title => 'Higher Education', :active => true, :groups => [ groups.last ] }, 
  { :title => 'Professional', :active => true, :groups => [ groups.last ] }, 
  { :title => 'Community', :active => true, :groups => [ groups.last ] }, 
  { :title => 'Football', :active => true, :groups => [ groups.first ] }, 
  { :title => 'Soccer', :active => true, :groups => [ groups.first ] }, 
  { :title => 'Track', :active => true, :groups => [ groups.first ] }, 
  { :title => 'Baseball/Softball', :active => true, :groups => [ groups.first ] }, 
  { :title => 'Tennis', :active => true, :groups => [ groups.first ] }, 
  { :title => 'Swimming/Diving', :active => true, :groups => [ groups.first ] }, 
  { :title => 'Basketball', :active => true, :groups => [ groups.first ] }, 
  { :title => 'New Construction', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Interior Renovation', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Exterior Renovation', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Expansion/Additions', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Master Plan', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Wayfinding/Env.', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Graphics', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Prototype', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Design/Rollout', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Feasability/Schematic', :active => true, :groups => [ groups[1] ] }, 
  { :title => 'Design', :active => true, :groups => [ groups[1] ] }, 
])

markets = Market.create([
  { :title => 'Sport', :nav_name => 'MSA Sport', :active => true, :color => '#f5b83c', :categories => [ categories[rand(categories.size)] ], :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. Proin congue viverra enim, interdum accumsan velit condimentum in. Donec suscipit bibendum rutrum. Nullam justo tortor, aliquet a convallis id, vehicula placerat est. In porttitor pharetra nisi in tempus. Integer lacinia nunc risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id nisi sem, vitae tempus diam. Morbi velit arcu, fringilla egestas aliquet in, suscipit eu tortor. Maecenas odio magna, vehicula vel pharetra non, ultrices eget ligula. Cras id purus metus, sed gravida nibh. Aliquam molestie, orci sed ultricies sodales, velit mi pulvinar tellus, eget eleifend tortor dolor quis lorem. Aliquam orci urna, blandit eget tincidunt quis, venenatis at leo. Maecenas pharetra bibendum metus vel auctor.' },
  { :title => 'Corporate', :nav_name => 'MSA Corporate', :active => true, :color => '#3186c7', :categories => [ categories[rand(categories.size)] ], :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. Proin congue viverra enim, interdum accumsan velit condimentum in. Donec suscipit bibendum rutrum. Nullam justo tortor, aliquet a convallis id, vehicula placerat est. In porttitor pharetra nisi in tempus. Integer lacinia nunc risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id nisi sem, vitae tempus diam. Morbi velit arcu, fringilla egestas aliquet in, suscipit eu tortor. Maecenas odio magna, vehicula vel pharetra non, ultrices eget ligula. Cras id purus metus, sed gravida nibh. Aliquam molestie, orci sed ultricies sodales, velit mi pulvinar tellus, eget eleifend tortor dolor quis lorem. Aliquam orci urna, blandit eget tincidunt quis, venenatis at leo. Maecenas pharetra bibendum metus vel auctor.' },
  { :title => 'Government', :nav_name => 'MSA Government', :active => true, :color => '#578f76', :categories => [ categories[rand(categories.size)] ], :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. Proin congue viverra enim, interdum accumsan velit condimentum in. Donec suscipit bibendum rutrum. Nullam justo tortor, aliquet a convallis id, vehicula placerat est. In porttitor pharetra nisi in tempus. Integer lacinia nunc risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id nisi sem, vitae tempus diam. Morbi velit arcu, fringilla egestas aliquet in, suscipit eu tortor. Maecenas odio magna, vehicula vel pharetra non, ultrices eget ligula. Cras id purus metus, sed gravida nibh. Aliquam molestie, orci sed ultricies sodales, velit mi pulvinar tellus, eget eleifend tortor dolor quis lorem. Aliquam orci urna, blandit eget tincidunt quis, venenatis at leo. Maecenas pharetra bibendum metus vel auctor.' },
  { :title => 'Education', :nav_name => 'MSA Education', :active => true, :color => '#8b8f25', :categories => [ categories[rand(categories.size)] ], :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. Proin congue viverra enim, interdum accumsan velit condimentum in. Donec suscipit bibendum rutrum. Nullam justo tortor, aliquet a convallis id, vehicula placerat est. In porttitor pharetra nisi in tempus. Integer lacinia nunc risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id nisi sem, vitae tempus diam. Morbi velit arcu, fringilla egestas aliquet in, suscipit eu tortor. Maecenas odio magna, vehicula vel pharetra non, ultrices eget ligula. Cras id purus metus, sed gravida nibh. Aliquam molestie, orci sed ultricies sodales, velit mi pulvinar tellus, eget eleifend tortor dolor quis lorem. Aliquam orci urna, blandit eget tincidunt quis, venenatis at leo. Maecenas pharetra bibendum metus vel auctor.' },
  { :title => 'Lifestyle', :nav_name => 'MSA Lifestyle', :active => true, :color => '#c93939', :categories => [ categories[rand(categories.size)] ], :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. Proin congue viverra enim, interdum accumsan velit condimentum in. Donec suscipit bibendum rutrum. Nullam justo tortor, aliquet a convallis id, vehicula placerat est. In porttitor pharetra nisi in tempus. Integer lacinia nunc risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id nisi sem, vitae tempus diam. Morbi velit arcu, fringilla egestas aliquet in, suscipit eu tortor. Maecenas odio magna, vehicula vel pharetra non, ultrices eget ligula. Cras id purus metus, sed gravida nibh. Aliquam molestie, orci sed ultricies sodales, velit mi pulvinar tellus, eget eleifend tortor dolor quis lorem. Aliquam orci urna, blandit eget tincidunt quis, venenatis at leo. Maecenas pharetra bibendum metus vel auctor.' },
  { :title => 'Religious', :nav_name => 'MSA Religious', :active => true, :color => '#7c629a', :categories => [ categories[rand(categories.size)] ], :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. Proin congue viverra enim, interdum accumsan velit condimentum in. Donec suscipit bibendum rutrum. Nullam justo tortor, aliquet a convallis id, vehicula placerat est. In porttitor pharetra nisi in tempus. Integer lacinia nunc risus. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Nullam id nisi sem, vitae tempus diam. Morbi velit arcu, fringilla egestas aliquet in, suscipit eu tortor. Maecenas odio magna, vehicula vel pharetra non, ultrices eget ligula. Cras id purus metus, sed gravida nibh. Aliquam molestie, orci sed ultricies sodales, velit mi pulvinar tellus, eget eleifend tortor dolor quis lorem. Aliquam orci urna, blandit eget tincidunt quis, venenatis at leo. Maecenas pharetra bibendum metus vel auctor.' },
])

(1..12).each do |i|
  projects = Project.create :title => "Test Project #{i}", :nav_name => "Test Project #{i}", :active => true, :markets => [ markets.first, markets.last ], :categories => [ categories.first,  categories[rand(categories.size)] ]
end