require 'rubygems'
require_relative 'StopWordManager.rb'
require_relative 'StorageManager.rb'
require_relative 'IndexManager.rb'

class KWIC
    include StopWord
    include Storage
    include Index

    @@raw_list = Storage.storage()
    @@updtd_titles = []
    @@indexed_list = []
    #print @raw_list

    def updt_titles()
        Storage.storage().each do |line|
            word = StopWord.stop_word(line)
            @@updtd_titles.push(word)
        end
        return @@updtd_titles
    end

    def kapuff()
        @@updtd_titles.each do |title|
            @@indexed_list.push(Index.alphabetize(title))
            print @@indexed_list
            puts
            puts
        end
    end

end

kwic = KWIC.new
kwic.updt_titles
kwic.kapuff