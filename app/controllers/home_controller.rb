require 'date'
include HomeHelper

class HomeController < ApplicationController
  layout false, only: [:view]
  def index
    render 'index'
  end

  def hello
    @name = params[:name]

      # redirect_to "http://www.google.com/", allow_other_host: true
      #redirect_to controller: HomeController, action: index
    redirect_to :bye # specify the name of the action
  end

  def upload
    @theText = ""
    @showform = true

    if request.method == "POST"

      filename = params[:file].original_filename
      file = params[:file].tempfile

      date = DateTime.now
      filename = date.min.to_s+" "+date.sec.to_s+" "+filename
      # Write file to upload directory
      path = File.join("public", "images", "upload", filename)
      File.open(path, "wb") do |f|
        f.write(file.read)
      end

      tessObj = Tesseract.new(filename)
      @showform = false
      @theText = tessObj.read
      render 'upload'
    end
    # the Erb file associated with this action gets rendered automatically
    
  end


  def view
    text = params[:review]
    filename = "DLROutput.txt"
    path = File.join("public", "output", filename)

    File.open(path, 'a') do |f|
      f.puts text
    end

    render 'view'
  end

end
