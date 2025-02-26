require 'sinatra'
require 'sinatra/partial'
require 'sinatra/reloader' if development?

# Set Public Folder
set :public_folder, File.join(settings.root, 'public')

# Set Partial Engine
set :partial_template_engine, :erb

# Set Views Folder
set :views, File.join(settings.root, 'src', 'views')

# Set the port and bind address
set :port, 4567  # Default Sinatra port
set :bind, '0.0.0.0'  # Allows access from other devices on your network

# Enable Sessions
use Rack::Session::Cookie, key: 'rack.session',
                           path: '/',
                           expire_after: 2592000, # 30 days
                           secret: 'a_very_long_and_secure_random_secret_key_that_is_at_least_64_bytes_long'



get '/' do
  # puts "Session ID: #{session.inspect}"
  @title = 'Sinatra TAH'
  erb :index, layout: :'layouts/main'
end

# HTMX Demo Route
get '/demo' do
  session[:count] ||= 0
  session[:count] += 1
  @count = session[:count]
  puts "The current count @ #{Time.now} is: #{@count}"

  erb :'partials/demo', layout: false
end

# Session Clear Route
# This route is used to clear the session count
get '/clear' do
  session.clear
  redirect '/'
end
