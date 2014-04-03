require 'tilt'
require 'sprockets'

require 'soupcms/core'
require 'soupcms/api'


SoupCMS::Common::Strategy::Application::SingleApp.configure do |app|
  app.app_name = "sunitblog"
  app.display_name = "Sunit Parekh's blog space sharing technical & agile experience"
  app.soupcms_api_url = 'http://sunitblog.herokuapp.com/api'
  app.app_base_url = 'http://sunitblog.herokuapp.com/'
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
  sprockets.append_path SoupCMS::Core::Template::Manager::DEFAULT_TEMPLATE_DIR
  sprockets.append_path PUBLIC_DIR
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
  run app
end


