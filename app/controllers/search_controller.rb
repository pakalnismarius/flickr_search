class SearchController < ApplicationController
  FlickRaw.api_key=ENV['KEY']
  FlickRaw.shared_secret=ENV['SECRET']

  def index
  end

  def search_result
    if !params[:tag].blank?
      session[:list] = []
      session[:list] = flickr.photos.search(tags: params[:tag]).map{|info| FlickRaw.url_b(info) }.each_slice(6).to_a
      redirect_to search_result_path
    end
  end

  def result
    @list = session[:list].paginate(page: params[:page], per_page: 5)
  end

end
