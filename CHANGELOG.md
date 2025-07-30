# KeycloakMiddleware Gem

KeycloakMiddleware is a Ruby gem that adds seamless Keycloak authentication to your Rails application.  
It provides configurable middleware to protect specific routes and enforce role-based access control (RBAC).

---

## Changelog

All notable changes to this project will be documented in this file.

This project adheres to [Semantic Versioning](https://semver.org/).

---

### [0.2.0] - 2025-07-30

#### Added

- Support for `Rails.application.credentials` to securely manage Keycloak configuration.
- JWT-based logout integration.
- Refactored configuration loader to eliminate `.env` dependency.
- Updated setup instructions to use encrypted credentials:

  > Run:  
  > `EDITOR="code --wait" bin/rails credentials:edit`  
  > And add the following YAML structure:

  ```yaml
  keycloak:
    realm: <your_realm_name>
    site: https://<your_keycloak_server>/
    client_id: <your_client_id>
    client_secret: <your_secret>
    redirect_uri: http://<your_app_url>:<port>/auth/callback

  redis:
    host: <redis_server_url>
    port: 6379
    db_session: 0

  secret_key_base: <your_secret_key_base>
  ```

### [0.1.4] - 2025-07-19

#### Added

- Initial release of KeycloakMiddleware.

- Plug-and-play middleware for integrating Keycloak authentication in Rails.

- Configurable route protection and role enforcement.

- Automatic JWKS fetching and JWT validation.

- Rails generator for creating the initializer.

- Sample .env file for legacy configuration support.

### [0.0.4] - 2025-07-10

#### Added

- First stable internal version.

---
