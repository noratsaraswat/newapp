require "spec_helper"

describe ContentInfosController do
  describe "routing" do

    it "routes to #index" do
      get("/content_infos").should route_to("content_infos#index")
    end

    it "routes to #new" do
      get("/content_infos/new").should route_to("content_infos#new")
    end

    it "routes to #show" do
      get("/content_infos/1").should route_to("content_infos#show", :id => "1")
    end

    it "routes to #edit" do
      get("/content_infos/1/edit").should route_to("content_infos#edit", :id => "1")
    end

    it "routes to #create" do
      post("/content_infos").should route_to("content_infos#create")
    end

    it "routes to #update" do
      put("/content_infos/1").should route_to("content_infos#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/content_infos/1").should route_to("content_infos#destroy", :id => "1")
    end

  end
end
