require_relative 'Scraper.rb'
require_relative 'StorageManager.rb'

input_array = ARGV
#   caso nao tenha parametros de entrada
if(input_array.length) == 0
    ARGV[0] = 'English'
end

stopword_list = Scraper.new('https://raw.githubusercontent.com/Zeitron/Stopwords/master/'+ARGV[0]+'')

stopword_list.scrap_page        # coleta os dados da pagina e indexa

stopword_list.filter_html       # filtra as palavras

stopword_list.write(ARGV[0])    # escreve no txt a nova lista de stop words

stopword_list.display(ARGV[0])  # mostra a lista de palavras
