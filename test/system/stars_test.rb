require "application_system_test_case"

class StarsTest < ApplicationSystemTestCase
  setup do
    @star = stars(:one)
  end

  test "visiting the index" do
    visit stars_url
    assert_selector "h1", text: "Stars"
  end

  test "creating a Star" do
    visit stars_url
    click_on "New Star"

    fill_in "Birth date", with: @star.birth_date
    fill_in "Country", with: @star.country
    fill_in "First name", with: @star.first_name
    fill_in "Last name", with: @star.last_name
    fill_in "Team", with: @star.team
    click_on "Create Star"

    assert_text "Star was successfully created"
    click_on "Back"
  end

  test "updating a Star" do
    visit stars_url
    click_on "Edit", match: :first

    fill_in "Birth date", with: @star.birth_date
    fill_in "Country", with: @star.country
    fill_in "First name", with: @star.first_name
    fill_in "Last name", with: @star.last_name
    fill_in "Team", with: @star.team
    click_on "Update Star"

    assert_text "Star was successfully updated"
    click_on "Back"
  end

  test "destroying a Star" do
    visit stars_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Star was successfully destroyed"
  end
end
