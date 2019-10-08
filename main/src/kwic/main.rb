require 'rubygems'
require_relative 'StopWordManager.rb'
require_relative 'StorageManager.rb'
require_relative 'IndexManager.rb'

class KWIC
    include StopWord
    include Storage
    include Index

end
