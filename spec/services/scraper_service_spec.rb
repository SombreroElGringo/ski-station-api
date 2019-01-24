require 'rails_helper'

describe ScraperService do
  context '.get_stations_from_html' do

    url = 'https://www.france-montagnes.com/massif/vosges'

    it 'lalala' do
      MASSIF.each do |url|
        # puts item
        ScraperService.new(url).get_stations_from_html()
      end
      expect(3).to equal(3)
    end

  end
end
