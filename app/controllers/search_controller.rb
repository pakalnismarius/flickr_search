class SearchController < ApplicationController
  FlickRaw.api_key=ENV['KEY']
  FlickRaw.shared_secret=ENV['SECRET']

  def index
  end

  def search_result
    if !params[:tag].blank?
      @list = flickr.photos.search(tags: params[:tag]).map{|info| FlickRaw.url_q(info) }.each_slice(6).to_a
    end
  end

end
