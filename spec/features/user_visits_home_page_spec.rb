require 'rails_helper'

feature 'User visits home page' do
  background { visit root_path }

  scenario 'they see a cascading drop down on the page', js: true do
    expect(page).to have_css('select#year')
    expect(page).to have_css('select#manufacturer_id[disabled]')
    expect(page).to have_css('select#model_id[disabled]')
    expect(page).to have_css('select#size_id[disabled]')
  end
end
