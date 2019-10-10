require 'nokogiri'
require 'httparty'

require_relative 'StorageManager.rb'

    class Scraper

        include File_io

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
            return @stopwords
        end

        def display(idioma)
            puts(File_io.read(''+idioma+'_stopwords'))        # coloca na tela as stopwords
        end

        def write(stopwords_file)
            File_io.write(stopwords_file,@stopwords)
        end
    end

