require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end
  end

  describe "POST #search_result" do
    context "with valid search tag like 'mail' and search result limit 100 " do
      before { controller.instance_variable_set(:@list, 100) } 
      it "creates an array of urls" do
        expect(assigns(:list)).to match flickr.photos.search(tags: "mail").map{|info| FlickRaw.url_q(info) }.count
      end
    end

    context "with not valid search tag 'NORESULT123' and search result limit 100 " do
      before { controller.instance_variable_set(:@list, []) } 
      it "creates an array of urls" do
        expect(assigns(:list)).to match flickr.photos.search(tags: 'NORESULT123').map{|info| FlickRaw.url_q(info) }
      end
    end

  end
end
