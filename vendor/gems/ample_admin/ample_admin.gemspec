# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "ample_admin"
  s.version = "0.1.4"
  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Bobby Uhlenbrock", "Taylor MacDonald"]
  s.date = "2012-02-23"
  s.email = "developers@helloample.com"
  s.extra_rdoc_files = [
    "README.textile"
  ]
  
  s.files = Dir['{app,config,db,lib}/**/*'] + ['MIT-LICENSE', 'Rakefile', 'README.rdoc']
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "A beautiful CMS Rails Engine"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["~> 3.1"])
      s.add_runtime_dependency(%q<capistrano>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, [">= 0"])
      s.add_runtime_dependency(%q<permalink_fu>, [">= 0"])
      s.add_runtime_dependency(%q<devise>, [">= 0"])
      s.add_runtime_dependency(%q<acts_as_indexed>, [">= 0"])
      s.add_runtime_dependency(%q<acts_as_markup>, ["~> 2.0.2"])
      s.add_runtime_dependency(%q<mechanize>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_runtime_dependency(%q<will_paginate>, [">= 0"])
      s.add_runtime_dependency(%q<jquery-rails>, [">= 0.2.6"])
      s.add_runtime_dependency(%q<rack-cache>, [">= 0"])
      s.add_runtime_dependency(%q<dragonfly>, ["~> 0.9.8"])
    else
      s.add_dependency(%q<rails>, ["~> 3.1"])
      s.add_dependency(%q<capistrano>, [">= 0"])
      s.add_dependency(%q<devise>, [">= 0"])
      s.add_dependency(%q<permalink_fu>, [">= 0"])
      s.add_dependency(%q<devise>, [">= 0"])
      s.add_dependency(%q<acts_as_indexed>, [">= 0"])
      s.add_dependency(%q<acts_as_markup>, ["~> 2.0.2"])
      s.add_dependency(%q<mechanize>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<will_paginate>, [">= 0"])
      s.add_dependency(%q<jquery-rails>, [">= 0.2.6"])
      s.add_dependency(%q<rack-cache>, [">= 0"])
      s.add_dependency(%q<dragonfly>, ["~> 0.9.8"])
    end
  else
    s.add_dependency(%q<rails>, ["~> 3.1"])
    s.add_dependency(%q<capistrano>, [">= 0"])
    s.add_dependency(%q<devise>, [">= 0"])
    s.add_dependency(%q<permalink_fu>, [">= 0"])
    s.add_dependency(%q<devise>, [">= 0"])
    s.add_dependency(%q<acts_as_indexed>, [">= 0"])
    s.add_dependency(%q<acts_as_markup>, ["~> 2.0.2"])
    s.add_dependency(%q<mechanize>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<will_paginate>, [">= 0"])
    s.add_dependency(%q<jquery-rails>, [">= 0.2.6"])
    s.add_dependency(%q<rack-cache>, [">= 0"])
    s.add_dependency(%q<dragonfly>, ["~> 0.9.8"])
  end
end

