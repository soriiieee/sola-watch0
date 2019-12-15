require "application_system_test_case"

class ArcivesTest < ApplicationSystemTestCase
  setup do
    @arcife = arcives(:one)
  end

  test "visiting the index" do
    visit arcives_url
    assert_selector "h1", text: "Arcives"
  end

  test "creating a Arcive" do
    visit arcives_url
    click_on "New Arcive"

    fill_in "Name", with: @arcife.name
    fill_in "Start time", with: @arcife.start_time
    click_on "Create Arcive"

    assert_text "Arcive was successfully created"
    click_on "Back"
  end

  test "updating a Arcive" do
    visit arcives_url
    click_on "Edit", match: :first

    fill_in "Name", with: @arcife.name
    fill_in "Start time", with: @arcife.start_time
    click_on "Update Arcive"

    assert_text "Arcive was successfully updated"
    click_on "Back"
  end

  test "destroying a Arcive" do
    visit arcives_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Arcive was successfully destroyed"
  end
end
