class PagesController < ApplicationController
  def home
  end

    def about
      require 'rubygems'
      require 'mechanize'
      agent = Mechanize.new

      page = agent.get("http://tenders.vic.gov.au/")
      @scrapings = page
    end
end
