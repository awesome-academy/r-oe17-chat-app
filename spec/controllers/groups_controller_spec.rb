require "rails_helper"

RSpec.describe GroupsController, type: :controller do
  let(:group){FactoryBot.build(:group)}

  describe "Method" do
    describe "Before Action" do
      it{is_expected.to use_before_action(:authenticate_user!)}
      it{is_expected.to use_before_action(:set_group)}
    end

    describe "GET #show" do
      before{get :show}
      it{is_expected.to render_with_layout("application")}
      it{is_expected.to render_template("message")}
    end
  end

  context "Route" do
    it{is_expected.to route(:get, "/groups/new").to(action: :new)}
    it{is_expected.to route(:post, "/groups").to(action: :create)}
    it{is_expected.to route(:get, "/groups/1").to(action: :show, id: 1)}
  end

  context "Layout" do

  end
end
