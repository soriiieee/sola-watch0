require "application_system_test_case"

class SatelightsTest < ApplicationSystemTestCase
  setup do
    @satelight = satelights(:one)
  end

  test "visiting the index" do
    visit satelights_url
    assert_selector "h1", text: "Satelights"
  end

  test "creating a Satelight" do
    visit satelights_url
    click_on "New Satelight"

    fill_in "Name1", with: @satelight.name1
    fill_in "Name2", with: @satelight.name2
    fill_in "Name3", with: @satelight.name3
    click_on "Create Satelight"

    assert_text "Satelight was successfully created"
    click_on "Back"
  end

  test "updating a Satelight" do
    visit satelights_url
    click_on "Edit", match: :first

    fill_in "Name1", with: @satelight.name1
    fill_in "Name2", with: @satelight.name2
    fill_in "Name3", with: @satelight.name3
    click_on "Update Satelight"

    assert_text "Satelight was successfully updated"
    click_on "Back"
  end

  test "destroying a Satelight" do
    visit satelights_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Satelight was successfully destroyed"
  end
end
