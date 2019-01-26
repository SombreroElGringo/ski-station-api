module Api::V1
  class StationsController < ApplicationController

    # GET /stations
    def index
      @stations = Station.all
      render json: @stations
    end

    # GET /stations/champ-du-feu
    def show
      @station = Station.find_by(code: params[:code])
      if @station
        render json: @station
      else
        response = {:status => "404", :message => "Station not found!"}
        render json: response, status: :not_found
      end
    end

  end
end
