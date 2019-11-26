require 'rubygems'
#require_relative 'StopWordManager.rb'
require_relative 'StorageManager.rb'
require_relative 'IndexManager.rb'
require_relative 'Scraper.rb'
require_relative 'StorageManager.rb'

# Permite parametros na entrada
input_array = ARGV
#   caso nao tenha parametros de entrada
if(input_array.length) != 2
    ARGV[0] = 'English'
    ARGV[1] = 'papers'
end

class KWIC
    include StopWord    # Responsavel salvar as stopwords no arquivo
    include File_io     # Responsavel por acessar arquivos
    include Index       # Responsavel por ordenar

    @@raw_list = File_io.read(ARGV[1])
    @@raw_stpWords = StopWord.getStopWords(ARGV[0])

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


stopword_list = Scraper.new('https://raw.githubusercontent.com/Zeitron/Stopwords/master/'+ARGV[0]+'')

stopword_list.scrap_page        # coleta os dados da pagina e indexa

stopword_list.filter_html       # filtra as palavras

stopword_list.write(ARGV[0])    # escreve no txt a nova lista de stop words

stopword_list.display(ARGV[0])           # mostra a lista de palavras
