require 'spec_helper'

feature 'Project manager creates TODO' do
  scenario 'Succesfully' do 
    visit new_todo_path
    fill_in 'Description', with: 'Meet up with the team'
    click_button 'Save'
    expect( page ).to have_content('Your new TODO was saved')
    expect( page ).to have_content('Meet up with the team')
  end 

  scenario "with description missing" do 
    visit new_todo_path
    fill_in 'Description', with: ''
    click_button 'Save'
    expect( page ).to have_content('Error creating to-do. Please try again.')
    expect( page ).to have_content("Description can't be blank")
  end
end