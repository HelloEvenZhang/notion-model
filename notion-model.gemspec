# frozen_string_literal: true

require_relative "lib/notion/version"

Gem::Specification.new do |spec|
  spec.name          = "notion-model"
  spec.version       = Notion::VERSION
  spec.authors       = ["even.z"]
  spec.email         = ["383490032@qq.com"]
  spec.summary       = "A ruby gem that allows you to read, write, and update Notion databases and pages like ActiveModel."
  spec.homepage      = "https://github.com/Ven0802/notion-model"
  spec.license       = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Ven0802/notion-model"
  spec.metadata["changelog_uri"] = "https://github.com/Ven0802/notion-model/releases"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "dotenv"
  spec.add_dependency "faraday", "~> 2.7"
  spec.add_development_dependency "debug"
  spec.add_development_dependency "rspec", "~> 3.2"
  spec.add_development_dependency "rubocop", "~> 1.7"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
end
