class SearchController < ApplicationController
  def index
    # fail params.inspect
    tags = params[:q]
    uri = URI("https://api.flickr.com/services/feeds/photos_public.gne?tags=#{tags}&format=json")
    @response =  JSON.parse(Net::HTTP.get(uri).gsub!('jsonFlickrFeed(', '').chomp(')'))
    exctract_from_api
  end

  private

  def exctract_from_api
    items = @response["items"]
    @array_search = items.map do |item|
      item["media"]["m"]
    end
  end
end
