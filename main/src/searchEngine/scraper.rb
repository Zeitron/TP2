require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  #url = "https://project.centeias.net/en_US/"
  #url = "https://www.kaggle.com/rtatman/stopword-lists-for-19-languages#portugueseST.txt"
  url = "https://www.yogajournal.com/poses/types"
  raw_page = HTTParty.get(url)
  page = Nokogiri::HTML(raw_page)
  yoga = page.css('h2.m-card--header-text').text
  #stopwords = page.css('div.jqvxeM').text
  byebug
end

scraper
