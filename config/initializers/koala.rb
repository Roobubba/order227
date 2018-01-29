Koala.configure do |config|
  config.access_token = ENV['FB_ACCESS_TOKEN']
  config.app_access_token = ENV['FB_APP_TOKEN']
  config.app_id = ENV['FB_APP_ID']
  config.app_secret = ENV['FB_APP_SECRET']
  config.api_version = "v2.11"
  # See Koala::Configuration for more options, including details on how to send requests through
  # your own proxy servers.
end
