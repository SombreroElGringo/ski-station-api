module Api::V1
  class StationsController < ApplicationController

    # GET /stations
    def index
      @stations = Station.all
      render json: @stations
    end

    # GET /stations/{code}
    def show
      @station = Station.find_by(code: params[:code])
      if @station
        render json: @station
      else
        response = {:status => "404", :message => "Station not found!"}
        render json: response, status: :not_found
      end
    end

    # GET /stations/scraper/{key}
    def scraper
      if params[:key] == SCRAPER_KEY
        puts "Clearing stations in DB"
        Station.delete_all

        MASSIF.each do |url|
          ScraperService.new(url).get_stations_from_html()
        end

        response = {:status => "222", :message => "Scraper finished successfully!"}
        render json: response
      else
        response = {:status => "403", :message => "Access denied!"}
        render json: response, status: :forbidden
      end
    rescue
        response = {:status => "500", :message => "Failed to scrape stations!"}
        render json: response, status: :internal_server_error
    end

  end
end
