class Api::V1::ShortVisitsController < ApplicationController
  # before_action :authenticate_user
  before_action :set_short_visit, only: [:show, :edit, :update, :destroy]

 
  def show
  end

 

 

  # POST /short_visits
  # POST /short_visits.json
  def create
    debugger
    # remote_ip method description in application controller
    ip = remote_ip
    geolocation_data=RestClient.get "freegeoip.net/json/#{ip}"
    @geolocation_data = JSON.parse(geolocation_data, :symbolize => true)
    debugger
    # @short_visit = ShortVisit.create(visitor_ip: params[:short_visit][:visitor_ip] )
    # # Location.create(:zip => params["location"]["zip"], :city => params["location"]["city"])
    # respond_to do |format|
    #   if @short_visit.save
    #     format.html { redirect_to @short_visit, notice: 'Short visit was successfully created.' }
    #     format.json { render :show, status: :created, location: @short_visit }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @short_visit.errors, status: :unprocessable_entity }
    #   end
    # end
     render json: {  errors: "ok", status: "failed" } 
  end

  # PATCH/PUT /short_visits/1
  # PATCH/PUT /short_visits/1.json
  def update
    respond_to do |format|
      if @short_visit.update(short_visit_params)
        format.html { redirect_to @short_visit, notice: 'Short visit was successfully updated.' }
        format.json { render :show, status: :ok, location: @short_visit }
      else
        format.html { render :edit }
        format.json { render json: @short_visit.errors, status: :unprocessable_entity }
      end
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_short_visit
      @short_visit = ShortVisit.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def short_visit_params
      params.require(:short_visit).permit(:short_url_id, :visitor_ip, :visitor_city, :visitior_state, :visitor_country_iso, :latitude, :longitude)
    end
end