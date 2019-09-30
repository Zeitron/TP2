## Transforma uma linha do file 'papers.txt' em um array 
## das palavras do título sem as stop-words

def stop_word(line)
    word_list = []
    word_list = line.split(' ')
    word_list.each_with_index do |word, idx|
        File.open('../resources/stop_words.txt').each do |stp_word|

            if word.to_s.strip.downcase == stp_word.to_s.strip
                word_list.delete_at(idx.to_i)
            end

        end
    end
    return word_list
end

array =[]
array = stop_word("An introduction to computer science")
##puts array