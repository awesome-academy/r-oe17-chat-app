require "rails_helper"

RSpec.describe Group, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:name).of_type(:string)}
    it{is_expected.to have_db_column(:is_active).of_type(:boolean)}
    it{expect(build(:group)).to be_valid}
  end

  context "Validations" do
    context "name" do
      it{is_expected.to validate_presence_of :name}
      it{is_expected.to validate_length_of :name}
    end

    context "is active" do
      it{is_expected.to validate_presence_of :is_active}
    end
  end

  context "Associations" do
    it{is_expected.to have_and_belong_to_many(:users)}
  end
end
