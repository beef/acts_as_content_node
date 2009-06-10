# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{acts_as_content_node}
  s.version = "0.1.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Steve England"]
  s.date = %q{2009-06-10}
  s.email = %q{steve@wearebeef.co.uk}
  s.extra_rdoc_files = [
    "LICENSE",
     "README.rdoc"
  ]
  s.files = [
    ".document",
     ".gitignore",
     "LICENSE",
     "README.rdoc",
     "Rakefile",
     "VERSION",
     "acts_as_content_node.gemspec",
     "generators/acts_as_content_node/USAGE",
     "generators/acts_as_content_node/acts_as_content_node_generator.rb",
     "init.rb",
     "lib/acts_as_content_node.rb",
     "lib/acts_as_content_node/content_node.rb",
     "lib/acts_as_content_node/publishable.rb",
     "rails/init.rb",
     "tasks/acts_as_content_node_tasks.rake",
     "test/acts_as_content_node_test.rb",
     "test/database.yml",
     "test/schema.rb",
     "test/test_helper.rb"
  ]
  s.homepage = %q{http://github.com/beef/acts_as_content_node}
  s.rdoc_options = ["--charset=UTF-8"]
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.3}
  s.summary = %q{Common functions for an record used as content of a website}
  s.test_files = [
    "test/acts_as_content_node_test.rb",
     "test/schema.rb",
     "test/test_helper.rb"
  ]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
    else
    end
  else
  end
end
