require 'spec_helper'

describe UsersController do

  def mock_users(stubs={})
    (@mock_users ||= mock_model(Users).as_null_object).tap do |users|
      users.stub(stubs) unless stubs.empty?
    end
  end

  describe "GET index" do
    it "assigns all users as @users" do
      Users.stub(:all) { [mock_users] }
      get :index
      assigns(:users).should eq([mock_users])
    end
  end

  describe "GET show" do
    it "assigns the requested users as @users" do
      Users.stub(:find).with("37") { mock_users }
      get :show, :id => "37"
      assigns(:users).should be(mock_users)
    end
  end

  describe "GET new" do
    it "assigns a new users as @users" do
      Users.stub(:new) { mock_users }
      get :new
      assigns(:users).should be(mock_users)
    end
  end

  describe "GET edit" do
    it "assigns the requested users as @users" do
      Users.stub(:find).with("37") { mock_users }
      get :edit, :id => "37"
      assigns(:users).should be(mock_users)
    end
  end

  describe "POST create" do

    describe "with valid params" do
      it "assigns a newly created users as @users" do
        Users.stub(:new).with({'these' => 'params'}) { mock_users(:save => true) }
        post :create, :users => {'these' => 'params'}
        assigns(:users).should be(mock_users)
      end

      it "redirects to the created users" do
        Users.stub(:new) { mock_users(:save => true) }
        post :create, :users => {}
        response.should redirect_to(user_url(mock_users))
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved users as @users" do
        Users.stub(:new).with({'these' => 'params'}) { mock_users(:save => false) }
        post :create, :users => {'these' => 'params'}
        assigns(:users).should be(mock_users)
      end

      it "re-renders the 'new' template" do
        Users.stub(:new) { mock_users(:save => false) }
        post :create, :users => {}
        response.should render_template("new")
      end
    end

  end

  describe "PUT update" do

    describe "with valid params" do
      it "updates the requested users" do
        Users.should_receive(:find).with("37") { mock_users }
        mock_user.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => "37", :users => {'these' => 'params'}
      end

      it "assigns the requested users as @users" do
        Users.stub(:find) { mock_users(:update_attributes => true) }
        put :update, :id => "1"
        assigns(:users).should be(mock_users)
      end

      it "redirects to the users" do
        Users.stub(:find) { mock_users(:update_attributes => true) }
        put :update, :id => "1"
        response.should redirect_to(user_url(mock_users))
      end
    end

    describe "with invalid params" do
      it "assigns the users as @users" do
        Users.stub(:find) { mock_users(:update_attributes => false) }
        put :update, :id => "1"
        assigns(:users).should be(mock_users)
      end

      it "re-renders the 'edit' template" do
        Users.stub(:find) { mock_users(:update_attributes => false) }
        put :update, :id => "1"
        response.should render_template("edit")
      end
    end

  end

  describe "DELETE destroy" do
    it "destroys the requested users" do
      Users.should_receive(:find).with("37") { mock_users }
      mock_user.should_receive(:destroy)
      delete :destroy, :id => "37"
    end

    it "redirects to the users list" do
      Users.stub(:find) { mock_users }
      delete :destroy, :id => "1"
      response.should redirect_to(users_url)
    end
  end

end
