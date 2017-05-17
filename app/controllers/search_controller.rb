class SearchController < ApplicationController
  FlickRaw.api_key=ENV['KEY']
  FlickRaw.shared_secret=ENV['SECRET']

  def index
  end
  
  def search_result
    @list = flickr.photos.search(tags: params[:tag])
    @urls = helpers.image_url_list(@list)
  end

end
