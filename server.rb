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

get '/' do
  @title = 'Sinatra TAH'
  erb :index, layout: :'layouts/main'
end
