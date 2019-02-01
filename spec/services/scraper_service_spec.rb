require 'rails_helper'

describe ScraperService do
  context '.get_stations_from_html' do

    it 'lalala' do
      MASSIF.each do |url|
        ScraperService.new(url).get_stations_from_html()
      end
      expect(3).to equal(3)
    end

  end
end
