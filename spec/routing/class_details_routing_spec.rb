require "spec_helper"

describe ClassDetailsController do
  describe "routing" do

    it "routes to #index" do
      get("/class_details").should route_to("class_details#index")
    end

    it "routes to #new" do
      get("/class_details/new").should route_to("class_details#new")
    end

    it "routes to #show" do
      get("/class_details/1").should route_to("class_details#show", :id => "1")
    end

    it "routes to #edit" do
      get("/class_details/1/edit").should route_to("class_details#edit", :id => "1")
    end

    it "routes to #create" do
      post("/class_details").should route_to("class_details#create")
    end

    it "routes to #update" do
      put("/class_details/1").should route_to("class_details#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/class_details/1").should route_to("class_details#destroy", :id => "1")
    end

  end
end
