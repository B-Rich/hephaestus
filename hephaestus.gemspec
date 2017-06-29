# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hephaestus/bot/version'

Gem::Specification.new do |spec|
  spec.name          = "hephaestus"
  spec.version       = Hephaestus::Bot::VERSION
  spec.authors       = ["Jelizondo"]
  spec.email         = ["jelizondo@icalialabs.com"]

  spec.summary       = %q{A Ruby Wrapper for IBM® Discovery Service.}
  spec.description   = %q{A Ruby Wrapper for IBM® Discovery Service.}
  spec.homepage      = "https://github.com/IcaliaLabs/hephaestus"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "olimpo", "~> 0.1.0"
  spec.add_development_dependency "bundler", "~> 1.13"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
