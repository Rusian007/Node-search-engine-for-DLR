require "sinatra"
require 'date'
require "./helpers/tesseract"
require "./helpers/readfile"
set :public_folder, __dir__ + '/views'

##get req for home page
get "/home" do
  erb:home
end

## get rq to upload page
get "/upload" do
  @toShow = true
  erb:upload
end

## Post req to upload file
post "/upload/file" do
  filename = params[:file][:filename]
  file = params[:file][:tempfile]
  date = DateTime.now
  filename = date.min.to_s+" "+date.sec.to_s+" "+filename

  #Read from uploaded file
  File.open("./uploads/#{filename}", 'wb') do |f|
    f.write(file.read)

  end

  tessObj = Tesseract.new(filename)
  theText = tessObj.read
  #puts theText.to_s

  #Write Results to file
  File.open("./outputs/Output.txt", 'a') do |f|
    f.puts theText.to_s
  end

  @toShow = false
  erb:upload
end

## Get path to show output of the files
get "/upload/view" do
  readObj = Readfile.new("Output.txt")
  output = readObj.ReadTheFile
  @output = output
  erb:view
end
