require "spec_helper"

describe TeacherDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/teacher_details").should route_to("teacher_details#index")
    end

    it "routes to #new" do
      get("/teacher_details/new").should route_to("teacher_details#new")
    end

    it "routes to #show" do
      get("/teacher_details/1").should route_to("teacher_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/teacher_details/1/edit").should route_to("teacher_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/teacher_details").should route_to("teacher_details#create")
    end

    it "routes to #update" do
      put("/teacher_details/1").should route_to("teacher_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/teacher_details/1").should route_to("teacher_details#destroy", :id => "1")
    end

  end
end
