require "rails_helper"

RSpec.describe HomeController, type: :controller do
  describe "GET #index" do
    it "returns http found" do
      get :index
      expect(response).to have_http_status(:found)
    end

    it "returns right messages list" do
      expect(assigns(:messages)) == Message.custom_display
    end
  end
end
