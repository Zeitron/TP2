require 'nokogiri'
require 'httparty'

    class Scraper

        def initialize(url)
            @url = url
        end

        def scrap_page
            raw_page = HTTParty.get(@url)          # coleta os dados da página web (html bruto)
            @page = Nokogiri::HTML(raw_page)       # indexa a página web
        end

        def filter_html
            raw_stopwords = @page.text             # define stopwords como a parte de texto da página
            @stopwords = raw_stopwords.split("\n") # parte o texto em palavras a cada '\n'
        end

        def display
            puts(@stopwords)                       # coloca na tela as stopwords
        end
    end

stopword_list = Scraper.new("https://raw.githubusercontent.com/Zeitron/Stopwords/master/Brazilian")

stopword_list.scrap_page        # coleta os dados da pagina e indexa

stopword_list.filter_html       # filtra as palavras

stopword_list.display           # mostra a lista de palavras
