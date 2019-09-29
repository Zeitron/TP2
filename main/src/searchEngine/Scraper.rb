require 'nokogiri'
require 'httparty'
require 'byebug'

def scraper
  url = "https://www.ranks.nl/stopwords/brazilian"
  raw_page = HTTParty.get(url)
  page = Nokogiri::HTML(raw_page)
  byebug
end

scraper
