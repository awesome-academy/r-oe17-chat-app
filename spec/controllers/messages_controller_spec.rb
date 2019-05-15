require "rails_helper"

RSpec.describe MessagesController, type: :controller do
  let(:message){FactoryBot.build(:message)}

  describe "POST create" do
    it{is_expected.to_not permit(:body).for(:create).on(:message)}
  end

  context "Route" do
    it{is_expected.to route(:post, "/message").to(action: :create)}
  end
end
