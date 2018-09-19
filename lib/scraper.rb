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
    binding.pry
    doc.css("roster-cards-container.student-card").each do |person|
      person_hash = {
        :location => person.css("card-text-container.p").text,
        :name => person.css("card-text-container.h4").text,
        :profile_url => person.css("a").text
      }
      people << person_hash
    end
    people
  end

  def self.scrape_profile_page(profile_url)

  end

end
