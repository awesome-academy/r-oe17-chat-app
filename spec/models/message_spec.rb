require "rails_helper"

RSpec.describe Message, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:body).of_type(:text)}
    it{is_expected.to have_db_column(:parent_id).of_type(:integer)}
    it{is_expected.to have_db_column(:user_id).of_type(:integer)}
    it{expect(build(:message)).to be_valid}
    it{expect(create(:message)).to be_valid}
  end

  context "Validations" do
    context "body" do
      it{is_expected.to validate_length_of(:body)}
    end
  end

  context "Associations" do
    it{is_expected.to belong_to(:user)}
    it{is_expected.to belong_to(:group)}
  end
end
