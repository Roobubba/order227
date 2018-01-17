module VenueHelper

  def display_venue(venue)
    venue.name + ", " + venue.city + ", " + venue.country
  end

end