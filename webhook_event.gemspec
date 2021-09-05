$LOAD_PATH.push File.expand_path("lib", __dir__)


require "webhook_event/version"

Gem::Specification.new do |spec|
  spec.name        = "webhook_event"
  spec.version     = WebhookEvent::VERSION
  spec.authors     = "sanad_abujbara"
  spec.email       = "s_wj_88@hotmail.com"
  spec.homepage    = "https://github.com/sanadwj/webhook_event"
  spec.summary     = "webhook integration for Rails applications."
  spec.description = "webhook integration for Rails applications."
  spec.license     = "MIT"


  spec.files       = `git ls-files`.split("\n")
  spec.test_files  = `git ls-files -- Appraisals {spec,gemfiles}/*`.split("\n")

  spec.add_dependency "rails", "~> 5.1"

  spec.add_dependency "activesupport", ">= 2.4"

  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "coveralls"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec-rails", "~> 3.7"
  spec.add_development_dependency "webmock", "~> 1.9"
end
