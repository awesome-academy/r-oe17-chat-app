require "rails_helper"

RSpec.describe User, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:name).of_type(:string)}
    it{is_expected.to have_db_column(:email).of_type(:string)}
    it{is_expected.to have_db_column(:address).of_type(:text)}
    it{is_expected.to have_db_column(:mobile).of_type(:string)}
    it{is_expected.to have_db_column(:title).of_type(:string)}

    it{expect(build(:user)).to be_valid}
    byebug
    it{expect(create(:user)).to be_valid}
  end

  context "Validations" do
    before do
      subject{build(:user)}
    end

    context "name" do
      it{is_expected.to validate_presence_of(:name)}
      it{is_expected.to validate_length_of(:name)}
    end

    context "email" do
      it{is_expected.to validate_presence_of(:email)}
      it{is_expected.to validate_length_of(:email)}
      it{is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity}
    end

    context "address" do
      it{is_expected.to validate_length_of(:address)}
    end

    context "mobile" do
      it{is_expected.to validate_length_of(:mobile)}
    end
  end

  context "Associations" do
    it{is_expected.to have_and_belong_to_many(:groups)}
  end
end
