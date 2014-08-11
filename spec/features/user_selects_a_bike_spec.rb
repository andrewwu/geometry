require 'rails_helper'

feature 'User selects a bike', js: true do
  background do
    # create manufacturers
    bmc = create(:manufacturer, name: 'BMC')
    specialized = create(:manufacturer, name: 'Specialized')
    pinarello = create(:manufacturer, name: 'Pinarello')
    cannondale = create(:manufacturer, name: 'Cannondale')

    # create models
    slr01_2011 = create(:model, year: 2011, name: 'SLR01', manufacturer: bmc)
    slr01_2014 = create(:model, year: 2014, name: 'SLR01', manufacturer: bmc)
    f8 = create(:model, year: 2015, name: 'F8', manufacturer: pinarello)
    specialized = create(:model, year: 2015, name: 'S-Works Tarmac',
                        manufacturer: specialized)
    caad9 = create(:model, year: 2010, name: 'CAAD9',
                  manufacturer: cannondale)

    # assign sizes
    slr01_2014.sizes << create(:size, frame_size: 48.0)
    f8.sizes << create(:size, frame_size: 46.5)
    specialized.sizes << create(:size, frame_size: 49.0)
    caad9.sizes << create(:size, frame_size: 48.0)

    visit root_path
  end

  scenario 'with valid year' do
    select '2014', from: 'year'
    expect(page).to have_select('year', options: %w(Year 2010 2011 2014 2015))
    expect(page).to have_select('manufacturer_id', options: %w(Manufacturer BMC))
    expect(page).to have_css('select#manufacturer_id:not([disabled])')
    expect(page).to have_css('select#model_id[disabled]')
    expect(page).to have_css('select#size_id[disabled]')
  end

  scenario 'with blank year' do
    select 'Year', from: 'year'
    expect(page).to have_css('select#manufacturer_id[disabled]')
    expect(page).to have_css('select#model_id[disabled]')
    expect(page).to have_css('select#size_id[disabled]')
  end

  scenario 'with valid manufacturer' do
    select '2010', from: 'year'
    select 'Cannondale', from: 'manufacturer_id'
    expect(page).to have_select('model_id', options: %w(Model CAAD9))
    expect(page).to have_css('select#model_id:not([disabled])')
    expect(page).to have_css('select#size_id[disabled]')
  end

  scenario 'with blank manufacturer' do
    select '2010', from: 'year'
    select 'Manufacturer', from: 'manufacturer_id'
    expect(page).to have_css('select#model_id[disabled]')
    expect(page).to have_css('select#size_id[disabled]')
  end

  scenario 'with valid model' do
    select '2010', from: 'year'
    select 'Cannondale', from: 'manufacturer_id'
    select 'CAAD9', from: 'model_id'
    expect(page).to have_select('size_id', options: %w(Size 48))
    expect(page).to have_css('select#size_id:not([disabled])')
  end

  scenario 'with blank model' do
    select '2010', from: 'year'
    select 'Cannondale', from: 'manufacturer_id'
    select 'Model', from: 'model_id'
    expect(page).to have_css('select#size_id[disabled]')
  end

  scenario 'with no sizes' do
    select '2011', from: 'year'
    select 'BMC', from: 'manufacturer_id'
    select 'SLR01', from: 'model_id'
    expect(page).to have_css('select#size_id[disabled]')
  end
end