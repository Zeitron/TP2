require 'rubygems'
require_relative 'StopWordManager.rb'
require_relative 'StorageManager.rb'
require_relative 'IndexManager.rb'

class KWIC
    include StopWord
    include Storage
    include Index

    @@raw_list = Storage.storage()

    def kapuff()
        @@updtd_titles.each do |title|
            @@indexed_list.push(Index.alphabetize(title))
        end

        print @@indexed_list
    end

end

kwic = KWIC.new
kwic.kapuff