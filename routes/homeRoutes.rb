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
  @toShow = true # true = show the upload file form
  @text = ""
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

  @toShow = false #Shows the upload form
  @text = theText.to_s
  erb:upload

end


## Get path to show output of the files and also write to output.txt
post "/upload/view" do
  theText = params[:review]

#Write Results to file
 File.open("./outputs/Output.txt", 'a') do |f|
  f.puts theText
 end

  erb:view
end

get "/json" do
  readObj = Readfile.new("Output2010.txt")
  # Call Json function
  "Reading File"
end
