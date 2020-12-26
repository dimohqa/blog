require "rails_helper"

RSpec.describe DraftsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/drafts").to route_to("drafts#index")
    end

    it "routes to #new" do
      expect(get: "/drafts/new").to route_to("drafts#new")
    end

    it "routes to #show" do
      expect(get: "/drafts/1").to route_to("drafts#show", id: "1")
    end

    it "routes to #edit" do
      expect(get: "/drafts/1/edit").to route_to("drafts#edit", id: "1")
    end


    it "routes to #create" do
      expect(post: "/drafts").to route_to("drafts#create")
    end

    it "routes to #update via PUT" do
      expect(put: "/drafts/1").to route_to("drafts#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "/drafts/1").to route_to("drafts#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "/drafts/1").to route_to("drafts#destroy", id: "1")
    end
  end
end
