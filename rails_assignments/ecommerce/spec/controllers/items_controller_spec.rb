require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
  context 'When ItemsController class being tested' do

    it 'For index should response with success and http status as 200' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'For index should render index.html.rb page' do
      get :index
      expect(response).to render_template('index')
    end

    it 'In index instance varibale @college should contain College' do
      itm1 = Item.create!(:item_name => "bag", :price => 99.99)
      itm2 = Item.create!(:item_name => "bag", :price => 99.99)
      get :index
      expect(assigns(:items)).to match_array([itm1, itm2])
    end

    it 'For create should create and render index.html.rb page' do
      expect {
        post :create, :items => {:item_name => "bag", :price => 99.99}
        }.to change(Item, :count).by(1)
      expect(response).to redirect_to items_path
    end
  
    it "deletes the items" do
      itm = Item.create!(:item_name => "bag", :price => 99.99)
      expect {
        delete :destroy, id: itm.id       
      }.to change(Item,:count).by(-1)
    end
  
  end
end