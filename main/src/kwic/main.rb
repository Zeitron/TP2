require 'rubygems'
require_relative 'StopWordManager.rb'
require_relative 'StorageManager.rb'
require_relative 'IndexManager.rb'

class KWIC
    include StopWord
    include Storage
    include Index

    @titles = Storage.storage()
    @updtd_titles = []
    @indexed_list = []

    def updt_titles(updtd_titles, titles)
        titles.each do |line|
            word = StopWord.stop_word(line)
            updtd_titles.push(word)
        end

        return updtd_titles
    end

    def kapuff(updtd_titles)
        updtd_titles.each do |title|
            indexed_list.push(Index.alphabetize(title))
            print indexed_list
        end
    end

end

kwic = KWIC.new
