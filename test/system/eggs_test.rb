require "application_system_test_case"

class EggsTest < ApplicationSystemTestCase
  setup do
    @egg = eggs(:one)
  end

  test "visiting the index" do
    visit eggs_url
    assert_selector "h1", text: "Eggs"
  end

  test "creating a Egg" do
    visit eggs_url
    click_on "New Egg"

    fill_in "Diffrating", with: @egg.diffRating
    fill_in "Game", with: @egg.game
    fill_in "Guide", with: @egg.guide
    fill_in "Title", with: @egg.title
    click_on "Create Egg"

    assert_text "Egg was successfully created"
    click_on "Back"
  end

  test "updating a Egg" do
    visit eggs_url
    click_on "Edit", match: :first

    fill_in "Diffrating", with: @egg.diffRating
    fill_in "Game", with: @egg.game
    fill_in "Guide", with: @egg.guide
    fill_in "Title", with: @egg.title
    click_on "Update Egg"

    assert_text "Egg was successfully updated"
    click_on "Back"
  end

  test "destroying a Egg" do
    visit eggs_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Egg was successfully destroyed"
  end
end
