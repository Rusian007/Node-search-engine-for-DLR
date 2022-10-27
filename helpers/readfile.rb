class Readfile

  def initialize(filename)
    @TheFilename = filename
    @location = "./outputs/#{@TheFilename}"
  end

  def ReadTheFile()
    theFile = File.open(@location)
    if theFile
      data = theFile.read
      return data
    else
      puts "File not Found :("
      return ""
    end
  end
end
