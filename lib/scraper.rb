require 'open-uri'
require 'pry'

class Scraper

  def self.get_page(url)
    doc = Nokogiri::HTML(open(url))
    #doc = File.open(url)
  end

  def self.scrape_index_page(index_url)
    doc = get_page(index_url)
    people = []
    doc.css("div.roster-cards-container").each do |person|
      # student-card
      #binding.pry
      person_hash = {
        :location => person.css("div.student-card a div.card-text-container p").text,
        :name => person.css("div.student-card div a card-text-container h4").text,
        :profile_url => person.css("div.student-card a").attribute("href")
      }
      people << person_hash
    end
    people
  end

  def self.scrape_profile_page(profile_url)

  end

end
