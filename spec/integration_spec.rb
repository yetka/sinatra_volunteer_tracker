require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe("users viewing all projects", {:type => :feature}) do
  it("allows an user to view all projects in database") do
    visit('/')
    click_link('Click here to see projects list')
    expect(page).to have_content('Your Current Projects')
  end
end
