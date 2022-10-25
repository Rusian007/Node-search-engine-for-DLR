require './routes/homeRoutes.rb'
set :public_folder, __dir__ + '/views'

##Get for main page
get "/" do
  erb:index
end

