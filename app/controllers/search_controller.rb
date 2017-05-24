class SearchController < ApplicationController
  FlickRaw.api_key=ENV['KEY']
  FlickRaw.shared_secret=ENV['SECRET']

  def index
  end

  def search_result
    if params[:tag].blank?
      flash[:primary] = "Unable to find any results, please add some text"
      redirect_to root_path
    else
      session[:list] = []
      session[:list] = flickr.photos.search(tags: params[:tag]).map{|info| FlickRaw.url_b(info) }.each_slice(6).to_a
      if session[:list].any?
        redirect_to search_result_path
      else
        flash[:danger] = "Can't find anything, try again!"
        redirect_to root_path
      end
    end
  end

  def result
    @list = session[:list].paginate(page: params[:page], per_page: 5)
  end

end
