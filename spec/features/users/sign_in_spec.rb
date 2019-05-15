require "rails_helper"

RSpec.feature "Sign in", :devise do
  let(:user){FactoryBot.create(:user)}

  scenario "user cannot sign in if not registered" do
    sign_in("test@example.com", "123")
    expect(page).to have_content I18n.t "devise.failure.not_found_in_database", authentication_keys: "Email"
  end

  scenario "user can sign in with valid credentials" do
    sign_in(user.email, user.password)
    expect(page).to have_content I18n.t "devise.sessions.signed_in"
  end

  scenario "user cannot sign in with wrong email" do
    sign_in("invalid@email.com", user.password)
    expect(page).to have_content I18n.t "devise.failure.not_found_in_database", authentication_keys: "Email"
  end

  scenario "user cannot sign in with wrong password" do
    sign_in(user.email, "invalidpass")
    expect(page).to have_content I18n.t "devise.failure.invalid", authentication_keys: "Email"
  end
end
