module Api::V1
  class StationsController < ApplicationController
    before_action :set_property, only: [:show]

    # GET /stations
    def index
      @stations = Station.all
      render json: @stations
    end

    # GET /stations/champ-du-feu
    def show
      render json: @property
    end

    private
    # Use callbacks to share common setup or constraints between actions.
    def set_property
      puts params[:code]
      @property = Station.find_by(code: params[:code])
    end
  end
end
