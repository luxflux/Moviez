if ENV['ENABLE_AIRBRAKE']

  Airbrake.configure do |config|
    config.api_key = ENV['AIRBRAKE_API_KEY']
    config.host    = ENV['AIRBRAKE_HOST']
    config.port    = ENV['AIRBRAKE_PORT'].to_i
    config.secure  = ENV['AIRBRAKE_PORT'].to_i == 443
  end

end
