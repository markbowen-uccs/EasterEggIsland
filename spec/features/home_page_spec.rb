require "rails_helper"


RSpec.feature "HomePages", type: :feature do
  scenario "The visitor should see eggs" do
    visit root_path
    expect(page).to have_text("Freshest Eggs")
  end
end
