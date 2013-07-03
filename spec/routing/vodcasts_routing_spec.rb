require "spec_helper"

describe VodcastsController do
  describe "routing" do

    it "routes to #index" do
      get("/vodcasts").should route_to("vodcasts#index")
    end

    it "routes to #new" do
      get("/vodcasts/new").should route_to("vodcasts#new")
    end

    it "routes to #show" do
      get("/vodcasts/1").should route_to("vodcasts#show", :id => "1")
    end

    it "routes to #edit" do
      get("/vodcasts/1/edit").should route_to("vodcasts#edit", :id => "1")
    end

    it "routes to #create" do
      post("/vodcasts").should route_to("vodcasts#create")
    end

    it "routes to #update" do
      put("/vodcasts/1").should route_to("vodcasts#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/vodcasts/1").should route_to("vodcasts#destroy", :id => "1")
    end

  end
end
