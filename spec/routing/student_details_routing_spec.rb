require "spec_helper"

describe StudentDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/student_details").should route_to("student_details#index")
    end

    it "routes to #new" do
      get("/student_details/new").should route_to("student_details#new")
    end

    it "routes to #show" do
      get("/student_details/1").should route_to("student_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/student_details/1/edit").should route_to("student_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/student_details").should route_to("student_details#create")
    end

    it "routes to #update" do
      put("/student_details/1").should route_to("student_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/student_details/1").should route_to("student_details#destroy", :id => "1")
    end

  end
end
