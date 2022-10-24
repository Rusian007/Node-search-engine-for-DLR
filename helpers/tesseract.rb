
class Tesseract

	def initialize(name)
		@image = name
		@location = "./uploads/#{@image}"
		#puts @image
	end

	def read
		text = RTesseract.new(@location)
  		#puts text.to_s //this gets returned automatically
	end

end