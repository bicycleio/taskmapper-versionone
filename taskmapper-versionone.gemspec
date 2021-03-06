# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "taskmapper-versionone"
  s.version = "0.4.2.8"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Rafael George"]
  s.date = "2013-09-17"
  s.description = "TaskMapper provider for accessing VersionOne."
  s.email = "george.rafael@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    ".rspec",
    ".rvmrc",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "lib/provider/comment.rb",
    "lib/provider/project.rb",
    "lib/provider/ticket.rb",
    "lib/provider/versionone.rb",
    "lib/taskmapper-versionone.rb",
    "lib/versionone/nokogiri_to_hash.rb",
    "lib/versionone/versionone-api.rb",
    "spec/fixtures/NewStory.xml",
    "spec/fixtures/Scope.xml",
    "spec/fixtures/Scope1009.xml",
    "spec/fixtures/ScopeTitleUpdate.xml",
    "spec/fixtures/Stories.xml",
    "spec/fixtures/Story1013.xml",
    "spec/fixtures/StoryTitleUpdate.xml",
    "spec/projects_spec.rb",
    "spec/spec_helper.rb",
    "spec/taskmapper-versionone_spec.rb",
    "spec/tickets_spec.rb",
    "taskmapper-versionone.gemspec"
  ]
  s.homepage = "http://github.com/hybridgroup/taskmapper-versionone"
  s.licenses = ["MIT"]
  s.require_paths = ["lib"]
  s.rubygems_version = "2.0.7"
  s.summary = "TaskMapper provider for accessing VersionOne"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<taskmapper>, [">= 0"])
      s.add_runtime_dependency(%q<nokogiri>, [">= 0"])
      s.add_development_dependency(%q<jeweler>, ["~> 1.6"])
      s.add_development_dependency(%q<rspec>, ["~> 2.3"])
      s.add_development_dependency(%q<simplecov>, ["~> 0.5"])
      s.add_development_dependency(%q<rcov>, ["~> 1.0"])
    else
      s.add_dependency(%q<taskmapper>, [">= 0"])
      s.add_dependency(%q<nokogiri>, [">= 0"])
      s.add_dependency(%q<jeweler>, ["~> 1.6"])
      s.add_dependency(%q<rspec>, ["~> 2.3"])
      s.add_dependency(%q<simplecov>, ["~> 0.5"])
      s.add_dependency(%q<rcov>, ["~> 1.0"])
    end
  else
    s.add_dependency(%q<taskmapper>, [">= 0"])
    s.add_dependency(%q<nokogiri>, [">= 0"])
    s.add_dependency(%q<jeweler>, ["~> 1.6"])
    s.add_dependency(%q<rspec>, ["~> 2.3"])
    s.add_dependency(%q<simplecov>, ["~> 0.5"])
    s.add_dependency(%q<rcov>, ["~> 1.0"])
  end
end

