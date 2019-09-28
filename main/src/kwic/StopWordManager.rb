def stop_word(line)
    word_list = []
    word_list = line.split(' ')
    word_list.each do |word|
        File.open('stop_words.txt').each do |stp_word|
            puts word.to_s
            puts stp_word.to_s
            puts word.to_s.strip == stp_word.to_s.strip
            puts
        end
    end
end

stop_word("a aren't is of of of a yourselves")