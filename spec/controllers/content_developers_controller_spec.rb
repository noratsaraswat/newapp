require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ContentDevelopersController do

  # This should return the minimal set of attributes required to create a valid
  # ContentDeveloper. As you add validations to ContentDeveloper, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all content_developers as @content_developers" do
      content_developer = ContentDeveloper.create! valid_attributes
      get :index
      assigns(:content_developers).should eq([content_developer])
    end
  end

  describe "GET show" do
    it "assigns the requested content_developer as @content_developer" do
      content_developer = ContentDeveloper.create! valid_attributes
      get :show, :id => content_developer.id.to_s
      assigns(:content_developer).should eq(content_developer)
    end
  end

  describe "GET new" do
    it "assigns a new content_developer as @content_developer" do
      get :new
      assigns(:content_developer).should be_a_new(ContentDeveloper)
    end
  end

  describe "GET edit" do
    it "assigns the requested content_developer as @content_developer" do
      content_developer = ContentDeveloper.create! valid_attributes
      get :edit, :id => content_developer.id.to_s
      assigns(:content_developer).should eq(content_developer)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new ContentDeveloper" do
        expect {
          post :create, :content_developer => valid_attributes
        }.to change(ContentDeveloper, :count).by(1)
      end

      it "assigns a newly created content_developer as @content_developer" do
        post :create, :content_developer => valid_attributes
        assigns(:content_developer).should be_a(ContentDeveloper)
        assigns(:content_developer).should be_persisted
      end

      it "redirects to the created content_developer" do
        post :create, :content_developer => valid_attributes
        response.should redirect_to(ContentDeveloper.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved content_developer as @content_developer" do
        # Trigger the behavior that occurs when invalid params are submitted
        ContentDeveloper.any_instance.stub(:save).and_return(false)
        post :create, :content_developer => {}
        assigns(:content_developer).should be_a_new(ContentDeveloper)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        ContentDeveloper.any_instance.stub(:save).and_return(false)
        post :create, :content_developer => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested content_developer" do
        content_developer = ContentDeveloper.create! valid_attributes
        # Assuming there are no other content_developers in the database, this
        # specifies that the ContentDeveloper created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        ContentDeveloper.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => content_developer.id, :content_developer => {'these' => 'params'}
      end

      it "assigns the requested content_developer as @content_developer" do
        content_developer = ContentDeveloper.create! valid_attributes
        put :update, :id => content_developer.id, :content_developer => valid_attributes
        assigns(:content_developer).should eq(content_developer)
      end

      it "redirects to the content_developer" do
        content_developer = ContentDeveloper.create! valid_attributes
        put :update, :id => content_developer.id, :content_developer => valid_attributes
        response.should redirect_to(content_developer)
      end
    end

    describe "with invalid params" do
      it "assigns the content_developer as @content_developer" do
        content_developer = ContentDeveloper.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ContentDeveloper.any_instance.stub(:save).and_return(false)
        put :update, :id => content_developer.id.to_s, :content_developer => {}
        assigns(:content_developer).should eq(content_developer)
      end

      it "re-renders the 'edit' template" do
        content_developer = ContentDeveloper.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        ContentDeveloper.any_instance.stub(:save).and_return(false)
        put :update, :id => content_developer.id.to_s, :content_developer => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested content_developer" do
      content_developer = ContentDeveloper.create! valid_attributes
      expect {
        delete :destroy, :id => content_developer.id.to_s
      }.to change(ContentDeveloper, :count).by(-1)
    end

    it "redirects to the content_developers list" do
      content_developer = ContentDeveloper.create! valid_attributes
      delete :destroy, :id => content_developer.id.to_s
      response.should redirect_to(content_developers_url)
    end
  end

end
