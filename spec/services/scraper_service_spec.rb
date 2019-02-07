require 'rails_helper'

describe ScraperService do
  context '.get_stations_from_html' do

    it 'should return a array of stations' do
      array_stations = []
      MASSIF.each do |url|
        array_stations = ScraperService.new(url).get_stations_from_html()
      end
      expect(array_stations.length).to equal(3)
    end

    it 'should return false' do
      bad_url = "https://www.france-montagnes.com/massif/azertyuiop"
      stations = ScraperService.new(bad_url).get_stations_from_html()
      expect(stations).to equal(false)
    end

  end
end
