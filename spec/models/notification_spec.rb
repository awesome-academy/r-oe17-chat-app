require "rails_helper"

RSpec.describe Notification, type: :model do
  context "Factory" do
    it{is_expected.to have_db_column(:notifiable_type).of_type(:string)}
    it{is_expected.to have_db_column(:action).of_type(:string)}
    it{is_expected.to have_db_column(:user_id).of_type(:integer)}
    it{is_expected.to have_db_column(:reciever_id).of_type(:integer)}

    it{expect(build(:notification)).to be_valid}
    it{expect(create(:notification)).to be_valid}
  end
end
