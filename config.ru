require 'tilt'
require 'sprockets'

require 'soupcms/core'
require 'soupcms/api'


SoupCMS::Common::Strategy::Application::SingleApp.configure do |app|
  app.app_name = 'sunitblog'
  app.display_name = 'sUnit Blog'
  if ENV['RACK_ENV'] == 'production'
    puts "HOST_NAME environment: #{ENV['HOST_NAME']}"
    prod_host = ENV['HOST_NAME'] || 'www.sunitparekh.in'
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
  app.set_redirect('http://sunitparekh.in/','http://www.sunitparekh.in/home')
  app.set_redirect('http://sunitparekh.in','http://www.sunitparekh.in/home')
  app.set_redirect('http://www.sunitparekh.in/','http://www.sunitparekh.in/home')
  app.set_redirect('http://www.sunitparekh.in','http://www.sunitparekh.in/home')

  app.set_redirect('http://blog.sunitparekh.in/','http://blog.sunitparekh.in/home')
  app.set_redirect('http://me.sunitparekh.in/','http://me.sunitparekh.in/home')

  # old blogger blog posts redirect
  app.set_redirect('http://www.sunitparekh.in/2011/04/design-for-feature-code-for-story.html','http://www.sunitparekh.in/posts/design-for-feature')
  app.set_redirect('http://www.sunitparekh.in/2012/02/nosql-learnings-gotchas-based-on.html','http://www.sunitparekh.in/posts/nosql-learning-n-gotchas')
  app.set_redirect('http://www.sunitparekh.in/2012/02/amazon-s3-learning-with-https-serving.html','http://www.sunitparekh.in/posts/amazon-s3-slow-with-https')
  app.set_redirect('http://www.sunitparekh.in/2011/11/ruby-vs-java-vs-net-how-much-does-it.html','http://www.sunitparekh.in/posts/programming-language')
  app.set_redirect('http://www.sunitparekh.in/2012/04/inception-board-term-cloud.html','http://www.sunitparekh.in/posts/term-cloud')
  app.set_redirect('http://www.sunitparekh.in/2012/04/inception-game-product-map.html','http://www.sunitparekh.in/posts/product-map')
  app.set_redirect('http://www.sunitparekh.in/2012/05/inception-board-process-timeline-map.html','http://www.sunitparekh.in/posts/process-timeline-map')
  app.set_redirect('http://www.sunitparekh.in/2012/05/distributed-team-communication-plan.html','http://www.sunitparekh.in/posts/distributed-team-communication')
  app.set_redirect('http://www.sunitparekh.in/2012/07/get-notified-with-push-notification.html','http://www.sunitparekh.in/posts/push-notification')
  app.set_redirect('http://www.sunitparekh.in/2012/09/data-anonymization.html','http://www.sunitparekh.in/posts/data-anonymization')
  app.set_redirect('http://www.sunitparekh.in/2012/09/data-anonymization-blacklist-whitelist.html','http://www.sunitparekh.in/posts/data-anonymization-techniques')
  app.set_redirect('http://www.sunitparekh.in/2013/02/why-responsive-web-design.html','http://www.sunitparekh.in/posts/why-responsive-web-design')
  app.set_redirect('http://www.sunitparekh.in/2013/05/identifying-cross-functional-and-non.html','http://www.sunitparekh.in/posts/cross-functional-requirements')
  app.set_redirect('http://www.sunitparekh.in/2013/05/scalable-non-blocking-architecture.html','http://www.sunitparekh.in/posts/non-blocking-architecture-pattern')
  app.set_redirect('http://www.sunitparekh.in/2013/10/blue-green-deployment.html','http://www.sunitparekh.in/posts/zero-downtime-blue-green-deployment')

  run app
end


