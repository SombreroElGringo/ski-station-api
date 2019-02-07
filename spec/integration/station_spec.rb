require 'swagger_helper'

describe 'Station API' do

  path '/api/v1/stations' do

    get 'Get all stations' do
      tags 'Stations'
      produces 'application/json', 'application/xml'

      response '200', 'stations found' do
        schema type: :array
        run_test!
      end
    end
  end

  path '/api/v1/stations/{code}' do

    get 'Get a station by code' do
      tags 'Stations'
      produces 'application/json', 'application/xml'
      parameter name: :code, :in => :path, :type => :string

      response '200', 'station found' do
        schema type: :object,
          properties: {
            code: { type: :string, },
            name: { type: :string },
            description: { type: :string },
            state: { type: :string },
            altitude: { type: :string },
            opening: { type: :string },
            partial_opening: { type: :string },
            snowpark: { type: :integer },
            styles: { type: :text },
            contact: { type: :text },
            domains: { type: :text },
            snowfall: { type: :text },
            open_domains: { type: :text },
            ski_pass: { type: :text },
            weather: { type: :text },
          },
          required: [ 'code' ]

        let(:code) { Station.create( code: "champ-du-feu", name: "CHAMP DU FEU", description: "Non loin de Strasbourg, le Champ du Feu dispose d'un domaine de ski alpin, ainsi que d'un domaine de ski de fond (gratuit), randonnées raquettes, luge, chiens de traîneau, randonnées pédestres....", state: "Domaine skiable ouvert", altitude: "900 m.", opening: "Du 22/12/2018 au 10/03/2019", partial_opening: "Du 22/12/2018 au 10/03/2019", snowpark: "1 Snowpark", styles: [ "sites nordiques", "stations villages de charme", "montagne douce", "étapes de montagne", "club" ], contact: { address: "Office de Tourisme de la Vallée de la Bruche 150, La Serva 67130 - CHAMP DU FEU", phone: "33 (0)3 88 97 39 50" }, domains: { info: "5 km de pistes", green: "5 pistes vertes", blue: "4 pistes bleues", red: "4 pistes rouges", black: "0 pistes noires" }, snowfall: { top: "25cm à 1099m", bottom: "25cm à 900m" }, open_domains: { info: "6 pistes sur 13", green: "3 pistes vertes", blue: "2 pistes bleues", red: "1 pistes rouges", black: "0 pistes noires" }, ski_pass: { day: "20,5 €", week: "140 €" }, weather: { state: "Couvert", morning: "Matin -9°", afternoon: "Après-midi -8°" }).code }
        run_test!
      end

      response '404', 'station not found' do
        let(:code) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/stations/scraper/{key}' do

    get 'Scrape all stations' do
      tags 'Stations'
      produces 'application/json', 'application/xml'
      parameter name: :key, :in => :path, :type => :string

      response '201', 'Scraper finished successfully!' do
        let(:key) { SCRAPER_KEY }
        run_test!
      end

      response '403', 'Access denied!' do
        let(:key) { 'invalid' }
        run_test!
      end
    end
  end

end
