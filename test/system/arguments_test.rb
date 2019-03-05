require "application_system_test_case"

class ArgumentsTest < ApplicationSystemTestCase
  setup do
    @argument = arguments(:one)
  end

  test "visiting the index" do
    visit arguments_url
    assert_selector "h1", text: "Arguments"
  end

  test "creating a Argument" do
    visit arguments_url
    click_on "New Argument"

    fill_in "Author name", with: @argument.author_name
    fill_in "Opinion", with: @argument.opinion_id
    click_on "Create Argument"

    assert_text "Argument was successfully created"
    click_on "Back"
  end

  test "updating a Argument" do
    visit arguments_url
    click_on "Edit", match: :first

    fill_in "Author name", with: @argument.author_name
    fill_in "Opinion", with: @argument.opinion_id
    click_on "Update Argument"

    assert_text "Argument was successfully updated"
    click_on "Back"
  end

  test "destroying a Argument" do
    visit arguments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Argument was successfully destroyed"
  end
end
