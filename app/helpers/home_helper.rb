module HomeHelper

  class Tesseract

    def initialize(name)
      @image = name
      @location = File.join("public", "images", "upload", name)
      # puts @image
      #puts @location
    end

    def read
      text = RTesseract.new(@location)
    end

  end
end
