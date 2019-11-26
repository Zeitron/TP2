module File_io

    def File_io.write(write_file,text)
        File.open('../resources/'+write_file+'_stopwords.txt', "w") { |file| file.puts text}
    end

    def File_io.read(read_file)
        titles =[]
        File.open('../resources/'+read_file+'.txt').each { |line| titles << (line.to_s.strip.split(" ")) }
        return titles
    end
end

print File_io.read('stopwords')