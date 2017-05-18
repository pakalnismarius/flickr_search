class SearchController < ApplicationController
  FlickRaw.api_key=ENV['KEY']
  FlickRaw.shared_secret=ENV['SECRET']

  def index
  end

  def search_result
    @list = flickr.photos.search(tags: params[:tag]).map{|x| FlickRaw.url_q(x) }.each_slice(4).to_a
  end

end
