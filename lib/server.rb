require "sinatra"

set :root, File.dirname(__FILE__) + "/../"

get "/" do
  File.readlines("public/index.html")
end

get "/about" do
  File.readlines("public/about.html")
end

get "/accomplish" do
  File.readlines("public/accomplish.html")
end
