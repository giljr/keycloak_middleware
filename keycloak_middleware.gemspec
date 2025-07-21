# frozen_string_literal: true

require_relative "lib/keycloak_middleware/version"

Gem::Specification.new do |spec|
  spec.name = "keycloak_middleware"
  spec.version = KeycloakMiddleware::VERSION
  spec.authors = ["Gilberto Oliveira Junior"]
  spec.email = ["giljr.2009@gmail.com"]

  spec.summary = "Plug-and-play Keycloak authentication middleware for Rails apps."
  spec.description = "Middleware to integrate Keycloak OpenID Connect flows, role-based access, and token validation into any Rails app."
  spec.homepage = "https://github.com/giljr/keycloak_middleware"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.1.0"

  spec.metadata["allowed_push_host"] = "https://github.com/giljr/keycloak_middleware"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/giljr/keycloak_middleware"
  spec.metadata["changelog_uri"] = "https://github.com/giljr/keycloak_middleware/blob/master/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  gemspec = File.basename(__FILE__)
  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  spec.add_dependency 'jwt'

  # For more information and examples about making a new gem, check out our
  # guide at: https://medium.com/jungletronics/rails-8-keycloak-integration-a-beginners-guide-e3b11dcaf560
end
