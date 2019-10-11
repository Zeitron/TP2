require 'rubygems'
require_relative 'StopWordManager.rb'
require_relative 'StorageManager.rb'
require_relative 'IndexManager.rb'

class KWIC
    include StopWord
    include Storage
    include Index


    papers = 'papers'
    stop_words = 'stop_words'

    @@raw_list = Storage.storage(papers)
    @@raw_stpWords = StopWord.getStopWords(stop_words)

    def kapuff()
        list = ''
        list = @@raw_list

        raw_hash = {}
        raw_hash = StopWord.generateHash(list[0])

        stop_words = []
        stop_words = @@raw_stpWords
        hash = {}
        hash = StopWord.markStopWords(raw_hash, stop_words)
        print hash
        
    end

end

kwic = KWIC.new
kwic.kapuff