class SearchController < ApplicationController
  FlickRaw.api_key=ENV['KEY']
  FlickRaw.shared_secret=ENV['SECRET']

  def search_result
    @list = flickr.photos.search(tags: "cars")
  end

end
