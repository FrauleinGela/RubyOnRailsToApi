# This file is used by Rack-based servers to start the application.


# This file is used by Rack-based servers to start the application.
require 'rack'
require 'rack/cors'
use Rack::Cors do
  allow do
    origins 'localhost:8080',
            /http:\/\/192\.168\.0\.\d{1,3}(:\d+)?/
            # regular expressions can be used here

    resource '*',
        :methods => [:get, :post, :put, :delete, :options],
        :headers => 'x-domain-token',
        :max_age => 600
        # headers to expose
  end

  allow do
    origins '*'
    resource '/public/*', :headers => :any, :methods => :get
  end
end



require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
require ::File.expand_path('../config/environment', __FILE__)
run Rails.application
