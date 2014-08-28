class FlightsController < ApplicationController
  include Apiint
  autocomplete :airport, :name, :full => true, :extra_data => [:code], :display_value => :show_code
  before_action :set_flight, only: [:show, :edit, :update, :destroy]

  # GET /flights
  # GET /flights.json
  def index
    
  end

  # GET /flights/1
  # GET /flights/1.json
  def show
  end
  def search
    res = Apiint::Wego.callapi(params[:trips])
    @list = JSON.parse(res)
    render :index
  end
  # GET /flights/new
  def new
    #byebug
    #@flight = Flight.new
    #@airport = Airport.all.map(&:name) 
  end
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_flight
      render :new
      #@flight = Flight.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def flight_params
      params[:flight]
    end
end
