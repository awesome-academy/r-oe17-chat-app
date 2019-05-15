require "rails_helper"

RSpec.feature "Sign up", :devise do
  let(:user){FactoryBot.build(:user)}

  scenario "guest can sign up with valid email address and password" do
    sign_up_with(user.name, user.email, user.password, user.password)
    txts = [I18n.t("devise.registrations.signed_up"), I18n.t("devise.registrations.signed_up_but_unconfirmed")]
    expect(page).to have_content(/.*#{txts[0]}.*|.*#{txts[1]}.*/)
  end

  scenario "guest cannot sign up with invalid email address" do
    sign_up_with(user.name, "invalid_email", user.password, user.password)
    expect(page).to have_content "Email is invalid"
  end

  scenario "guest cannot sign up without password" do
    sign_up_with(user.name, user.email, "", "")
    expect(page).to have_content "Password can't be blank"
  end

  scenario "guest cannot sign up with a short password" do
    sign_up_with(user.name, user.email, "123", "123")
    expect(page).to have_content "Password is too short"
  end

  scenario "guest cannot sign up without password confirmation" do
    sign_up_with(user.name, user.email, user.password, "")
    expect(page).to have_content "Password confirmation doesn't match"
  end

  scenario "guest cannot sign up with mismatched password and confirmation" do
    sign_up_with(user.name, user.email, user.password, "123")
    expect(page).to have_content "Password confirmation doesn't match"
  end
end
