Keycloak.configure do |config|
  config.server_url = "http://localhost:8080/auth"
  # config.server_url = "auth:8080"
  config.realm_id   = "jibber-jabber-test"

  config.logger     = Rails.logger
  config.skip_paths = {
    post:   [/^\/message/],
    get:    [/^\/locales/, /^\/health\/.+/]
  }
end
