require "spec_helper"
require "rails_helper" # used to define the methods get, post etc

RSpec.describe CustomersController, :type => :controller do


	context "When testing CustomerController class" do
		it "Should response with success and HTTP 200 status" do
			get :index
			expect(response).to be_success
			expect(response).to have_http_status(200)
		end

		it "Should render index.html.rb page" do
			get :index
			expect(response).to render_template("index")
		end

		it "Should load all the Customers in @customers" do
			cus1 = Customer.create!(:name => "xyz", :email => "xyz@g.com", :city => "vizag", :pincode => "321")
			cus2 = Customer.create!(:name => "xyz", :email => "xyz@g.com", :city => "vizag", :pincode => "321")
			get :index
			expect(assigns(:customers)).to match_array([cus1,cus2])
		end

		it 'For create should create and render index.html.rb page' do
	      expect {
	        post :create, :customers => {:name => "xyz", :email => "xyz@g.com", :city => "vizag", :pincode => "321"}
	        }.to change(Customer, :count).by(1)
	      expect(response).to redirect_to customers_path
	    end

	    it "renders the #show view" do
		      get :show, id: Customer.create!(:name => "xyz", :email => "xyz@g.com", :city => "vizag", :pincode => "321")
		      expect(response).to render_template('show')
	    end
	  
	    it "deletes the customer" do
	      cus = Customer.create!(:name => "xyz", :email => "xyz@g.com", :city => "vizag", :pincode => "321")
	      expect {
	        delete :destroy, id: cus.id       
	      }.to change(Customer,:count).by(-1)
	    end
	end
end