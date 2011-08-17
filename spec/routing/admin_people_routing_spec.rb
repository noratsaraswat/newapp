require "spec_helper"

describe AdminPeopleController do
  describe "routing" do

    it "routes to #index" do
      get("/admin_people").should route_to("admin_people#index")
    end

    it "routes to #new" do
      get("/admin_people/new").should route_to("admin_people#new")
    end

    it "routes to #show" do
      get("/admin_people/1").should route_to("admin_people#show", :id => "1")
    end

    it "routes to #edit" do
      get("/admin_people/1/edit").should route_to("admin_people#edit", :id => "1")
    end

    it "routes to #create" do
      post("/admin_people").should route_to("admin_people#create")
    end

    it "routes to #update" do
      put("/admin_people/1").should route_to("admin_people#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/admin_people/1").should route_to("admin_people#destroy", :id => "1")
    end

  end
end
