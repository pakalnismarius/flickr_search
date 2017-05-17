module SearchHelper

  def to_url(object)
    info = flickr.photos.getInfo(photo_id: object.id)
    FlickRaw.url_s(info)
  end

  def image_url_list(search_list)
    url_list = []
    search_list.each do |item|
      url_list << to_url(item)
    end
   url_list
  end
  
end
