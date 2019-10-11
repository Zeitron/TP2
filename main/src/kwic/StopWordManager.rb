## Module to handle stop words

module StopWord

    def StopWord.getStopWords(filename)
        word_list = []
        File.open('../resources/'+filename.to_s+'.txt').each do |stp_word|
            word_list.push(stp_word.to_s.strip.downcase)
        end
        return word_list
    end

    def StopWord.generateHash(line)
        raw_hash = []
        raw_line = Array.new(line.split(' '))
        raw_line.each do |word|
            raw_hash << [word.downcase, 0]
        end
        return raw_hash 
    end

    def StopWord.markStopWords(hash, word_list)
        hash.each do |pair|
            word_list.each do |stp_word|
                if pair.first == stp_word
                    pair[1] = 1
                end
            end
        end
        return hash
    end
    
end

filename = "stop_words"
list = []
list = StopWord.getStopWords(filename)

line = "Incremental methods in programming"
hash = Array.new(StopWord.generateHash(line))

markedhash = StopWord.markStopWords(hash, list)

