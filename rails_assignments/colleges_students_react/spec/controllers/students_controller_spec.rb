require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  context 'When StudentsController class being tested' do

    it 'For index should response with success and http status as 200' do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it 'For index should render index.html.rb page' do
      College.create!(:name => "xyz", :establish => 123)
      Student.create!(:college_id => 1, :maths=>1, :physics=>2, :chemistry=>3, :year=>2002, :regid=>1, :dept=>"a")
      get :index
      expect(response).to render_template('index')
    end

    it 'For create should response with success, http status as 200 and render index.html.rb page' do
      col = College.create!(:name => "xyz", :establish => 123)
      expect {
        post :create, :student => {:regid => 1, :college_id => col.id}
        }.to change(Student, :count).by(1)
      expect(response).to redirect_to students_path

    end
  
    it "deletes the student" do
      College.create!(:name => "xyz", :establish => 123)
      stu = Student.create!(:college_id => 1, :maths=>1, :physics=>2, :chemistry=>3, :year=>2002, :regid=>1, :dept=>"a")
      expect {
        delete :destroy, id: stu.id       
      }.to change(Student,:count).by(-1)
    end
  end
end