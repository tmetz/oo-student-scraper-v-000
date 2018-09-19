require 'open-uri'
require 'pry'

class Scraper

  def get_page(url)
    doc = Nokogiri::HTML(open(url))
  end

  def self.scrape_index_page(index_url)
    doc = get_page(index_url)
    people = []
    doc.css("roster-cards-container.student-card").each do |person|
      person_hash = {}
      person_hash = {
        :name => person.css("card-text-container.h4").text
        :location => person.css("card-text-container.p").text
        :profile_url => person.css("a").text
      }
      people << person_hash
    end
  end

  def self.scrape_profile_page(profile_url)
    
  end

end

