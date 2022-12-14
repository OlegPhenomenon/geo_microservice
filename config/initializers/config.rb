Config.setup do |config|
  config.use_env = true
  config.env_prefix = 'ENV'
  config.env_separator = '__'
end

# There is a register method in the config gem
# for Sinatra application, but it improper handles
# a symbol from the Sinatra environment method
setting_files = Config.setting_files(
  File.expand_path('..', __dir__),
  ENV['RACK_ENV']
)

Config.load_and_set_settings(setting_files)