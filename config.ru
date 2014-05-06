require 'tilt'
require 'sprockets'

require 'soupcms/core'
require 'soupcms/api'


SoupCMS::Common::Strategy::Application::SingleApp.configure do |app|
  app.app_name = 'sunitblog'
  app.display_name = 'sUnit Blog'
  if ENV['RACK_ENV'] == 'production'
    puts "HOST_NAME environment: #{ENV['HOST_NAME']}"
    prod_host = ENV['HOST_NAME'] || 'blog.sunitparekh.in'
    app.soupcms_api_url = "http://#{prod_host}/api"
    app.app_base_url = "http://#{prod_host}/"
  else
    app.soupcms_api_url = 'http://localhost:9292/api'
    app.app_base_url = 'http://localhost:9292/'
  end

end


map '/api' do
  SoupCMSApi.configure do |config|
    config.application_strategy = SoupCMS::Common::Strategy::Application::SingleApp
    config.data_resolver.register(/content$/,SoupCMS::Api::Resolver::KramdownMarkdownResolver)
  end
  run SoupCMSApiRackApp.new
end

PUBLIC_DIR = File.join(File.dirname(__FILE__), 'public')
map '/assets' do
  sprockets = SoupCMSCore.config.sprockets
  sprockets.append_path PUBLIC_DIR
  sprockets.append_path SoupCMS::Core::Template::Manager::DEFAULT_TEMPLATE_DIR
  Sprockets::Helpers.configure do |config|
    config.environment = sprockets
    config.prefix = '/assets'
    config.public_path = nil
    config.digest = true
  end
  run sprockets
end

map '/' do
  SoupCMSCore.configure do |config|
    config.application_strategy = SoupCMS::Common::Strategy::Application::SingleApp
  end
  app = SoupCMSRackApp.new
  app.set_redirect('http://blog.sunitparekh.in/','http://blog.sunitparekh.in/home')
  app.set_redirect('http://me.sunitparekh.in/','http://me.sunitparekh.in/home')
  run app
end


