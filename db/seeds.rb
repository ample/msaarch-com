users = User.create([
  { :first_name => 'Taylor', :last_name => 'MacDonald', :email => 'taylor@helloample.com', :password => 'ample2008', :password_confirmation => 'ample2011', :admin => true },
])

homepage = Page.create :title => 'Home', :subtitle => '<strong>Design<br>is<br>life</strong> and we<br>have a<br>passion<br>for<br>living', :active => true, :permalink => 'index', :nav_name => 'Home', :nav_position => 'header', :body => 'We have six core markets, each with its own dedicated architects living and breathing their genre. But our culture is collaborative. Which means that the latest sports trends leak into our newest retail construction and that a technological advancement in education can make a new restaurant design better.', :sort_order => 1
portfolio = Page.create :title => 'Portfolio', :active => true, :permalink => 'portfolio', :nav_name => 'Portfolio', :nav_position => 'header', :sort_order => 2
team = Page.create :title => 'Team', :subtitle => '<strong>Our Culture</strong><br>Is Built On Collaboration', :active => true, :permalink => 'team', :nav_name => 'Team', :nav_position => 'header', :template_filename => 'team', :body => "As architects, we believe in solid foundations. Our's consists of the people we work with every day. They're talented, creative, intense, funny and interesting &mdash; the kind of people that inspire others to think bigger and do more. We believe that putting a pencil to paper is as important as computer skills. And that an architects job is as much about building relationships as it is about buildings. \n\nScroll down to meet the people that are taking us to a beautifully designed future.", :sort_order => 3
news = Page.create :title => 'News', :active => true, :permalink => 'news', :nav_name => 'News', :nav_position => 'header', :sort_order => 4, :template_filename => 'news'
contact = Page.create :title => 'Contact', :active => true, :permalink => 'contact', :nav_name => 'Contact', :nav_position => 'header', :sort_order => 5

[homepage, team].each do |page|
  (1..5).each do |i|
    Feature.create :owner => page, :title => "#{i}: MSA petitions for Opening Day", :active => true, :feature_type => 'feature', :body => "The doors at MSA Architecture are closed on Opening Day. And they have been for the last 25 Opening Days." 
  end
end

(1..5).each do |i|
  Feature.create :owner => news, :title => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. ", :active => true, :feature_type => 'link', :link => "http://google.com" 
end

parent_categories = Category.create([
  { :title => 'Sport', :active => true }, 
  { :title => 'Construction', :active => true }, 
  { :title => 'Other', :active => true }, 
])

categories = Category.create([
  { :title => 'ECE-12', :active => true, :parent => parent_categories[2] }, 
  { :title => 'Higher Education', :active => true, :parent => parent_categories[2] }, 
  { :title => 'Professional', :active => true, :parent => parent_categories[2] }, 
  { :title => 'Community', :active => true, :parent => parent_categories[2] }, 
  { :title => 'Football', :active => true, :parent => parent_categories[0] }, 
  { :title => 'Soccer', :active => true, :parent => parent_categories[0] }, 
  { :title => 'Track', :active => true, :parent => parent_categories[0] }, 
  { :title => 'Baseball/Softball', :active => true, :parent => parent_categories[0] }, 
  { :title => 'Tennis', :active => true, :parent => parent_categories[0] }, 
  { :title => 'Swimming/Diving', :active => true, :parent => parent_categories[0] }, 
  { :title => 'Basketball', :active => true, :parent => parent_categories[0] }, 
  { :title => 'New Construction', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Interior Renovation', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Exterior Renovation', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Expansion/Additions', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Master Plan', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Wayfinding/Env.', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Graphics', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Prototype', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Design/Rollout', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Feasability/Schematic', :active => true, :parent => parent_categories[1] }, 
  { :title => 'Design', :active => true, :parent => parent_categories[1] }, 
])

markets = Market.create([
  { :title => 'Sport', :nav_name => 'MSA Sport', :active => true, :color => '#f5b83c', :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. ' },
  { :title => 'Corporate', :nav_name => 'MSA Corporate', :active => true, :color => '#3186c7', :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. ' },
  { :title => 'Government', :nav_name => 'MSA Government', :active => true, :color => '#578f76', :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. ' },
  { :title => 'Education', :nav_name => 'MSA Education', :active => true, :color => '#8b8f25', :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. ' },
  { :title => 'Lifestyle', :nav_name => 'MSA Lifestyle', :active => true, :color => '#c93939', :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. ' },
  { :title => 'Religious', :nav_name => 'MSA Religious', :active => true, :color => '#7c629a', :body => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non orci id ipsum viverra pharetra a at nisi. Sed eu enim nulla, ac tristique nunc. Nunc dolor urna, interdum sed hendrerit ac, ullamcorper a ligula. Aenean tempus hendrerit eros, sed aliquet odio pellentesque a. ' },
])

(1..48).each do |i|
  Project.create :title => "Test Project #{i}", :subtitle => 'Renovations and Additions to the Existing Stadium', :location => 'Cincinnati, OH', :nav_name => "Test Project #{i}", :active => true, :markets => [ markets[rand(markets.size)] ], :categories => [ categories[rand(categories.size)], categories[rand(categories.size)], categories[rand(categories.size)] ].uniq, :teaser => 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut sed risus a lectus cursus auctor. Nulla mollis posuere est vitae dictum. In facilisis auctor euismod. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum quam eros, varius ac tempor vel, placerat eu mi. ', :body => "Aenean lacinia bibendum nulla sed consectetur. Praesent commodo cursus magna, vel scelerisque nisl consectetur et. Vestibulum id ligula porta felis euismod semper. Cras mattis consectetur purus sit amet fermentum. Curabitur blandit tempus porttitor. \n\nVivamus sagittis lacus vel augue laoreet rutrum faucibus dolor auctor. Donec ullamcorper nulla non metus auctor fringilla. Donec ullamcorper nulla non metus auctor fringilla. Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum. Vestibulum id ligula porta felis euismod semper. Cras mattis consectetur purus sit amet fermentum. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vila ut id elit. \n\nDonec ullamcorper nulla non metus auctor fringilla. Etiam porta sem malesuada magna mollis euismod. Aenean eu leo quam. Pellentesque ornare sem lacinia quam. "
end

(2..30).each do |i|
  User.create :first_name => "User", :last_name => "#{i}", :credentials => 'AIA LEED AP', :education => "The Ohio State University | Master of Architecture \nMiami University | B.A. in Environmental Design", :email => "user#{i}@msaarch.com", :password => 'ample2011', :password_confirmation => 'ample2011', :active => true, :bio => "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam at aliquet ante. Morbi orci odio, facilisis venenatis bibendum dapibus, gravida et dui. Morbi purus tortor, vehicula nec mollis in, iaculis eget tortor. \n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nunc ullamcorper nunc ut libero interdum scelerisque a at ligula. Nunc quis mauris ut ipsum dictum fermentum a a felis. Aenean dui augue, imperdiet nec laoreet ut, pretium eu tellus. Suspendisse ornare semper nulla et dignissim. Proin id urna purus."
end

(1..20).each do |i|
  Post.create :created_at => "2010-" + rand(12).to_s + "-01", :title => i.to_s + ': Proin rhoncus felis ac dui rutrum imperdiet auctor felis molestie.', :teaser => 'Morbi leo risus, porta ac consectetur ac, vestibulum at eros. Curabitur blandit tempus porttitor. ', :body => 'Donec tincidunt nisi vel metus rhoncus fermentum. Vivamus pretium cursus libero, in blandit sem accumsan et. Proin urna lectus, ultricies eget luctus cursus, pellentesque nec est. Suspendisse suscipit metus quis tellus elementum blandit. Donec porta aliquam risus nec lobortis. In nec congue sem. Quisque eget purus ut tortor ultrices auctor quis fringilla lectus. Maecenas rutrum laoreet leo. Sed posuere pretium ornare. Nullam consequat convallis purus, quis laoreet eros sagittis vitae. In lacinia tellus in turpis volutpat ac condimentum odio consequat.', :active => true
end

(1..20).each do |i|
  Award.create :awarded_date => "20" + rand(11).to_s.rjust(2, '0') + "-01-01", :title => 'Proin rhoncus felis ac dui rutrum.', :source => 'Morbi leo risus', :active => true, :project_id => rand(48)
end

(1..10).each do |i|
  Update.create :body => i.to_s + ': Praesent ultricies iaculis quam, sit amet tincidunt diam malesuada quis.', :link => 'http://google.com', :active => true
end
