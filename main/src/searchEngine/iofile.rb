
module iofile

    def iofile
        File.open("stopwords", "w") { |file| file.puts "I wrote this with ruby!"}
    end
end