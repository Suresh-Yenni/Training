require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  context 'When OrderController class being tested' do

    it 'For index should response with success and http status as 200' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'For index should render index.html.rb page' do
      get :index
      expect(response).to render_template('index')
    end

    it 'In index instance varibale @details should contain orders' do
      cus = Customer.create!(:name => "xyz", :email => "xyz@g.com", :city => "vizag", :pincode => "321")
      itm = Item.create!(:item_name => "bag", :price => 99.99)
      odr = Order.create!(:date => "2016-12-16", :customer_id => 1, :item_id => 1)
      result = ['xyz','bag']
      get :index
      expect(assigns(:details)).to match_array([result])
    end

    it 'For create should create and render index.html.rb page' do
      cus = Customer.create!(:name => "xyz", :email => "xyz@g.com", :city => "vizag", :pincode => "321")
      itm = Item.create!(:item_name => "bag", :price => 99.99)
      expect {
        post :create, :orders => {:date => "2016-12-16", :customer_id => 1, :item_id => 1}
        }.to change(Order, :count).by(1)
      expect(response).to redirect_to orders_home_path

    end
  
    it "deletes the order" do
      cus = Customer.create!(:name => "xyz", :email => "xyz@g.com", :city => "vizag", :pincode => "321")
      itm = Item.create!(:item_name => "bag", :price => 99.99)
      odr = Order.create!(:date => "2016-12-16", :customer_id => 1, :item_id => 1)
      expect {
        delete :destroy, id: odr.id       
      }.to change(Order,:count).by(-1)
    end
  
  end
end