require "spec_helper"

describe ContentDevelopersController do
  describe "routing" do

    it "routes to #index" do
      get("/content_developers").should route_to("content_developers#index")
    end

    it "routes to #new" do
      get("/content_developers/new").should route_to("content_developers#new")
    end

    it "routes to #show" do
      get("/content_developers/1").should route_to("content_developers#show", :id => "1")
    end

    it "routes to #edit" do
      get("/content_developers/1/edit").should route_to("content_developers#edit", :id => "1")
    end

    it "routes to #create" do
      post("/content_developers").should route_to("content_developers#create")
    end

    it "routes to #update" do
      put("/content_developers/1").should route_to("content_developers#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/content_developers/1").should route_to("content_developers#destroy", :id => "1")
    end

  end
end
