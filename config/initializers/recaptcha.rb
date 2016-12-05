# frozen_string_literal: true
Recaptcha.configure do |config|
  config.site_key = Rails.application.secrets.recaptcha_site_key
  config.secret_key = Rails.application.secrets.recaptcha_site_secret
end
