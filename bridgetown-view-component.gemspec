# frozen_string_literal: true

require_relative "lib/bridgetown-view-component/version"

Gem::Specification.new do |spec|
  spec.name          = "bridgetown-view-component"
  spec.version       = Bridgetown::ViewComponent::VERSION
  spec.author        = "Bridgetown Team"
  spec.email         = "maintainers@bridgetownrb.com"
  spec.summary       = "Brings GitHub's ViewComponent library to Bridgetown"
  spec.homepage      = "https://github.com/bridgetownrb/bridgetown-view-component"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r!^(test|script|spec|features|frontend)/!) }
  spec.test_files    = spec.files.grep(%r!^spec/!)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 3.2.0" # Matches  view_component 4.0

  spec.add_dependency "bridgetown", ">= 2.0", "< 3.0"
  spec.add_dependency "view_component", ">= 4.0"
  # TODO: remove this dependency on actionview once view_component
  # has this dependency explicitly declared and releases new version: https://github.com/ViewComponent/view_component/pull/2461
  spec.add_dependency "actionview", [">= 7.1.0", "< 8.1"] # Matches view_component 4.0

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "nokogiri", "~> 1.6"
  spec.add_development_dependency "rake", "~> 13.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rubocop-bridgetown", "~> 0.3"
end
