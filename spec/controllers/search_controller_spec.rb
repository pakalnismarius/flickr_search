require 'rails_helper'

RSpec.describe SearchController, type: :controller do

  describe "GET #index" do
    it "responds successfully with an HTTP 200 status code" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

  #   let(:tag) { 'cat' }
  #   let(:search_result) { [] }

  #   it "search for result" do
  #     Search.should_receive(:text_search).with(tag).and_return search_result
  #     get :search_result, tag: tag
  #     expect(assigns(:list)).to eq []
  #   end
  # end


end
