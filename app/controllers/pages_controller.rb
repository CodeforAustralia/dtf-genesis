class PagesController < ApplicationController
  def home
  end

  def chars_up_to_stars
  end

    def about
      require 'rubygems'
      require 'mechanize'
      agent = Mechanize.new

      url = "https://www.tenders.vic.gov.au/tenders/contract/list.do?showSearch=false&action=contract-search-submit&issuingBusinessId=5154&issuingBusinessIdForSort=5154&awardDateFromString=04/07/2016"
      page = agent.get(url)
      link_debug = ""
      # action=contract-search-submit
#      page.search("a[@action='contract-search-submit']").each do |link|
      #page.links_with(:class => 'action').each do |link|
#      page.search("a#MSG2").each do |link|
      #page.search("div").css("a") do |link|
      #  link_debug += "<p>" + link.text + "</p>"
      #end
#      doc = Nokogiri::HTML(open(url))
      #hrefs = doc.css("a")
#      hrefs = URI.extract(page.body)
#      stuff = page.parser.css("a")
      # we only need id: <a href="view.do?id=25481&amp;
      # then we can get contract info from:
      # www.tenders.vic.gov.au/tenders/contract/view.do?id=<<ID HERE>>
       # id**MSG2**CTX16170062**a
      #.gsub(/[^0-9A-Za-z.\-]/,"__")
      #refs = safe_body[//]

      # starts with "a href="view.do?id="
      # && ends in "&amp;returnUrl="
      @scrapings = page.body.gsub("view.do?id=","___").gsub("&amp;","___").split("___")
    end
end
