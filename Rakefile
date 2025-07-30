# frozen_string_literal: true

require "rake"
require "bundler/gem_tasks"
# This Rakefile is used to manage tasks related to the Keycloak Middleware gem.
namespace :release do
  desc "Show release message for the current version"
  task :message do
    version = KeycloakMiddleware::VERSION
    puts "🔖 Releasing version #{version}"

    message = `git log -1 --pretty=%B`.strip
    puts "📝 Commit message:"
    puts message
  end
end
