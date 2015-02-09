class LocationsController < ApplicationController

    def index
      @locations = Location.all
    end

    def show
      @location = Location.find(params[:id])
      @events = @location.events
    end

    def new
      @location = Location.new
    end

    def create
      @location = Location.new(location_params)
      if @location.save
        redirect_to locations_path, notice: 'Event was successfully created.'
      else
        render :new
      end
    end

    def edit
      @location = Location.find(params[:id])
    end

    def update
      @location = Location.find(params[:id])
      @location.update_attributes(location_params)
      redirect_to locations_path, notice: 'Event was successfully updated.'
    end

    def destroy
      @location = Location.find(params[:id])
      @location.destroy
      redirect_to locations_path, notice: 'Event was successfully deleted.'
    end

    private

    def location_params
      params.require(:location).permit(:name, :address, :zipcode)
    end

end
