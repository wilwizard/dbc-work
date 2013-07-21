require 'spec_helper'

describe "Functional" do
  let!(:user) {create(:user)}
  before do 
    100.times do
      create(:user)
    end
  end

  it "moves to next page when forward arrow is clicked", js: true do
    visit root_path
    within '.pagination-section' do
      find("ul").find('li:last-child').find('a').click
    end
    expect(page).to have_content "Page: 2"
  end

  it "stays on same page when back arrow is clicked on page 1", js: true do
    visit root_path
    within '.pagination-section' do
      find("ul").find('li:first-child').find('a').click
    end
    expect(page).to have_content "Page: 1"
  end


  
end
