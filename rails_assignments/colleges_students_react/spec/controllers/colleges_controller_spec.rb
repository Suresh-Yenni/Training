require 'rails_helper'

RSpec.describe CollegesController, type: :controller do
  context 'When CollegesController class being tested' do

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
      col1 = College.create!(:name => "xyz", :establish => 123)
      col2 = College.create!(:name => "xyz", :establish => 123)
      get :index
      expect(assigns(:college)).to match_array([col1, col2])
    end

    it 'For create should response with success, http status as 200 and render index.html.rb page' do
      expect {
        post :create, :college => {:name => "MVGR", :establish => "1996"}
        }.to change(College, :count).by(1)
      expect(response).to redirect_to colleges_path

    end

    it "renders the #show view" do
      get :show, id: College.create!(:name => "xyz", :establish => 123)
      expect(response).to render_template('show')
    end
  
    it "deletes the college" do
      col = College.create!(:name => "xyz", :establish => 123)
      expect {
        delete :destroy, id: col.id       
      }.to change(College,:count).by(-1)
    end
  
  end
end