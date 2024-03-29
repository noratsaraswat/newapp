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

describe TeachersController do

  # This should return the minimal set of attributes required to create a valid
  # Teacher. As you add validations to Teacher, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    {}
  end

  describe "GET index" do
    it "assigns all teachers as @teachers" do
      teacher = Teacher.create! valid_attributes
      get :index
      assigns(:teachers).should eq([teacher])
    end
  end

  describe "GET show" do
    it "assigns the requested teacher as @teacher" do
      teacher = Teacher.create! valid_attributes
      get :show, :id => teacher.id.to_s
      assigns(:teacher).should eq(teacher)
    end
  end

  describe "GET new" do
    it "assigns a new teacher as @teacher" do
      get :new
      assigns(:teacher).should be_a_new(Teacher)
    end
  end

  describe "GET edit" do
    it "assigns the requested teacher as @teacher" do
      teacher = Teacher.create! valid_attributes
      get :edit, :id => teacher.id.to_s
      assigns(:teacher).should eq(teacher)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Teacher" do
        expect {
          post :create, :teacher => valid_attributes
        }.to change(Teacher, :count).by(1)
      end

      it "assigns a newly created teacher as @teacher" do
        post :create, :teacher => valid_attributes
        assigns(:teacher).should be_a(Teacher)
        assigns(:teacher).should be_persisted
      end

      it "redirects to the created teacher" do
        post :create, :teacher => valid_attributes
        response.should redirect_to(Teacher.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved teacher as @teacher" do
        # Trigger the behavior that occurs when invalid params are submitted
        Teacher.any_instance.stub(:save).and_return(false)
        post :create, :teacher => {}
        assigns(:teacher).should be_a_new(Teacher)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Teacher.any_instance.stub(:save).and_return(false)
        post :create, :teacher => {}
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested teacher" do
        teacher = Teacher.create! valid_attributes
        # Assuming there are no other teachers in the database, this
        # specifies that the Teacher created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Teacher.any_instance.should_receive(:update_attributes).with({'these' => 'params'})
        put :update, :id => teacher.id, :teacher => {'these' => 'params'}
      end

      it "assigns the requested teacher as @teacher" do
        teacher = Teacher.create! valid_attributes
        put :update, :id => teacher.id, :teacher => valid_attributes
        assigns(:teacher).should eq(teacher)
      end

      it "redirects to the teacher" do
        teacher = Teacher.create! valid_attributes
        put :update, :id => teacher.id, :teacher => valid_attributes
        response.should redirect_to(teacher)
      end
    end

    describe "with invalid params" do
      it "assigns the teacher as @teacher" do
        teacher = Teacher.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Teacher.any_instance.stub(:save).and_return(false)
        put :update, :id => teacher.id.to_s, :teacher => {}
        assigns(:teacher).should eq(teacher)
      end

      it "re-renders the 'edit' template" do
        teacher = Teacher.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Teacher.any_instance.stub(:save).and_return(false)
        put :update, :id => teacher.id.to_s, :teacher => {}
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested teacher" do
      teacher = Teacher.create! valid_attributes
      expect {
        delete :destroy, :id => teacher.id.to_s
      }.to change(Teacher, :count).by(-1)
    end

    it "redirects to the teachers list" do
      teacher = Teacher.create! valid_attributes
      delete :destroy, :id => teacher.id.to_s
      response.should redirect_to(teachers_url)
    end
  end

end
