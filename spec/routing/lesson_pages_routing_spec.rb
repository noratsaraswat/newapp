require "spec_helper"

describe LessonPagesController do
  describe "routing" do

    it "routes to #index" do
      get("/lesson_pages").should route_to("lesson_pages#index")
    end

    it "routes to #new" do
      get("/lesson_pages/new").should route_to("lesson_pages#new")
    end

    it "routes to #show" do
      get("/lesson_pages/1").should route_to("lesson_pages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/lesson_pages/1/edit").should route_to("lesson_pages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/lesson_pages").should route_to("lesson_pages#create")
    end

    it "routes to #update" do
      put("/lesson_pages/1").should route_to("lesson_pages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/lesson_pages/1").should route_to("lesson_pages#destroy", :id => "1")
    end

  end
end
