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
    doc.css("div.roster-cards-container div.student-card").each do |person|
      # student-card
      #binding.pry
      person_hash = {
        :name => person.css("a h4").text,
        :location => person.css("a p").text,
        :profile_url => person.css("a").attribute("href").text
      }
      people << person_hash
    end
    people
  end

  def self.scrape_profile_page(profile_url)

  end

end
