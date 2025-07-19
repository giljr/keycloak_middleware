# Keycloak Middleware

✅ *Plug-and-play Keycloak authentication middleware for Rails apps, with configurable protected paths and roles.*


Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/keycloak_middleware`. To experiment with that code, run `bin/console` for an interactive prompt.

## 💄Features
```
- OpenID Connect Authorization Code Flow
- JWT validation using JWKS from Keycloak
- Role-based access control
- Configurable protected paths and roles per app
- Plug & play: no controllers or models required
```
---
## Installation

### Usage - 🚀 Quick Workflow
✅ Add gem to your app’s Gemfile:
To use the gem directly from GitHub (for example during development), add this to your Gemfile:
```bash
gem 'keycloak_middleware', git: 'https://github.com/giljr/keycloak_middleware.git'
```
✅ Install dependencies:
```ruby
bundle install
```
✅ Generate the initializer:
```ruby
bin/rails generate keycloak_middleware:install
```
✅ Fill in .env or Rails credentials.
```ruby
KEYCLOAK_REALM=<your_realm_name>
KEYCLOAK_SITE=<keycloak_server_url>           # e.g., http://localhost:8080
KEYCLOAK_CLIENT_ID=<your_client_name>
KEYCLOAK_CLIENT_SECRET=<your_client_secret_key>
KEYCLOAK_REDIRECT_URI=<redirect_url>           # e.g., http://localhost:3000/auth/callback

REDIS_HOST=<your_redis_server_url>             # e.g., localhost
REDIS_PORT=6379
REDIS_DB_SESSION=0

```
✅ Confirm redis is up and running:
[HOW TO INSTALL REDIS](https://github.com/giljr/keycloak_middleware/blob/master/REDIS_INSTALLATION.md)

✅ Define protected paths and roles in `config/initializers/keycloak_middleware.rb`. 

✅ Enable debug mode to output OAuth 2.0 details to your terminal.
```ruby
Rails.application.config.middleware.use KeycloakMiddleware::Middleware do |config|
  # Configure the protected paths and required roles
  config.debug = true
  config.protect "/secured", role: "user"
  config.protect "/admin", role: "admin"

  # Configure the redirection logic on successful login
  config.on_login_success = proc do |roles|
    if roles.include?('admin')
      '/admin'
    elsif roles.include?('user')
      '/secured'
    else
      '/'
    end
  end
end
```
✅ Update: `config/environments/development.rb`

```ruby
   config.cache_store = :redis_cache_store, {
    url: ENV.fetch("REDIS_URL") { "redis://<redis_server>:6379/1" },
    namespace: "cache"
  }
```
✅ Create: `config/initializers/session_store.rb`

```ruby
Rails.application.config.session_store :cache_store,
  key: "_keycloak_app_session",
  expire_after: 90.minutes

```
✅ Test Redis
```bash
redis-cli
127.0.0.1:6379> ping
```
response:
```bash
PONG
```

✅ Test if middleware was loaded
```bash
rails middleware
127.0.0.1:6379> ping
```
response:
```bash
...
use KeycloakMiddleware::Middleware**
run KeycloakApp::Application.routes
```

✅ Done! Your middleware is active.



bin/rails generate keycloak_middleware:install

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/giljr/keycloak_middleware. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/giljr/keycloak_middleware/blob/master/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the KeycloakMiddleware project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/giljr/keycloak_middleware/blob/master/CODE_OF_CONDUCT.md).
