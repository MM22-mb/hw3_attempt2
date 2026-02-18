class PlacesController < ApplicationController
  def index
    @places = Place.all
    #render places/index view
  end

  def show
    # find a place
    @place = Place.find_by({"id" => params["id"]})
    # find an Entry for the Place
    @entry = Entry.where({"place_id" => @place["id"]})
    # render places/show view with details about place
  end

  def new
    #render places/new view with new place form
  end

  def create
    # start with a new Place
    @place = Place.new

    #assign user-entered form data to Place's columns
    @place["name"] = params["name"]

    # save Place row
    @place.save

    #redirect user
    redirect_to "/places"
  end

  def edit
     # find a Place
    @place = Place.find_by({ "id" => params["id"] })
    # render view with edit Place form
  end

  def update
    # find a Place
    @place = Place.find_by({ "id" => params["id"] })

    # assign user-entered form data to Company's columns
    @place["name"] = params["name"]

    # save Company row
    @place.save

    # redirect user
    redirect_to "/places"
  end

    def destroy
    # find a Place
    @place = Place.find_by({ "id" => params["id"] })

    # destroy Company row
    @place.destroy

    # redirect user
    redirect_to "/places"
  end

end