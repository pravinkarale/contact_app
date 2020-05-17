require_relative 'boot'
require 'rails/all'

Bundler.require(*Rails.groups)

module ContactApp
  class Application < Rails::Application
    config.load_defaults 5.1
    config.active_job.queue_adapter = :delayed_job
    config.before_configuration do
      env_file = File.join(Rails.root, 'config', 'local_env.yml')
      YAML.load(File.open(env_file)).each do |key, value|
        ENV[key.to_s] = value
      end if File.exists?(env_file)
    end
  end
end
