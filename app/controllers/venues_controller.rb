class VenuesController < ApplicationController

  def index
    matching_venues = Venue.all
    @venues = matching_venues.order(:created_at)

    render({ :template => "venue_templates/venue_list" })
  end

  def show
    venue_id = params.fetch("venue_id")
    matching_venues = Venue.where({ :id => venue_id }).first
    @the_venue = matching_venues

    render({ :template => "venue_templates/details" })
  end

  def create
    @the_venue = Venue.new
    @the_venue.address = params.fetch("query_address")
    @the_venue.name = params.fetch("query_name")
    @the_venue.neighborhood = params.fetch("query_neighborhood")
    @the_venue.save
    redirect_to("/venues/#{@the_venue.id}")
    #render({ :template => "venue_templates/details" })
  

  end
  
  def update
    the_id = params.fetch("the_id")

    @venue = Venue.where({ :id => the_id }).first
    @venue.address = params.fetch("query_address")
    @venue.name = params.fetch("query_name")
    @venue.neighborhood = params.fetch("query_neighborhood")
    @venue.save
    
    redirect_to("/venues/#{@venue.id}")
  end

  def delete_venue
    the_id = params.fetch("id_to_delete")

    matching_venues = Venue.where({ :id => the_id }).first
    matching_venues.destroy


    redirect_to("/venues")
  end

end
