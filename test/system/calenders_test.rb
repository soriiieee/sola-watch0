require "application_system_test_case"

class CalendersTest < ApplicationSystemTestCase
  setup do
    @calender = calenders(:one)
  end

  test "visiting the index" do
    visit calenders_url
    assert_selector "h1", text: "Calenders"
  end

  test "creating a Calender" do
    visit calenders_url
    click_on "New Calender"

    fill_in "Name", with: @calender.name
    fill_in "Start time", with: @calender.start_time
    click_on "Create Calender"

    assert_text "Calender was successfully created"
    click_on "Back"
  end

  test "updating a Calender" do
    visit calenders_url
    click_on "Edit", match: :first

    fill_in "Name", with: @calender.name
    fill_in "Start time", with: @calender.start_time
    click_on "Update Calender"

    assert_text "Calender was successfully updated"
    click_on "Back"
  end

  test "destroying a Calender" do
    visit calenders_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Calender was successfully destroyed"
  end
end
