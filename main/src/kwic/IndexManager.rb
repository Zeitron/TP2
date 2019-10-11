## Recebe a lista gerada em WordShift e 
## a retorna alfabeticamente ordenada

require_relative 'WordShift.rb'
require_relative 'StopWordManager.rb'

module Index
    include WordShift
    include StopWord

    def Index.alphabetize(title)
        permuted = WordShift.circular_shift(title)
        return permuted.sort
    end

    def Index.alphabetize(marked_hash)
        word = ''
        marked_hash.map do |pair,stp_word|
            i = 0
            marked_hash.length.times do
                #puts pair
                #puts marked_hash[(i.to_i)][0]
                #puts
                i = i + 1
            end
        end

    end
    
end

filename = "stop_words"
list = []
list = StopWord.getStopWords(filename)

line = "methods incremental in programming"
hash = Array.new(StopWord.generateHash(line))

markedhash = StopWord.markStopWords(hash, list)

Index.alphabetize(markedhash)

