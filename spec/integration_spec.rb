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

describe("users viewing label for new project", {:type => :feature}) do
  it("allows an user to add new project to database") do
    visit('/')
    click_link('Click here to add new Project')
    expect(page).to have_content('Add New Project')
  end
end

describe("users viewing label for new volunteer", {:type => :feature}) do
  it("allows an user to add new volunteer to database") do
    visit('/')
    click_link('Click here to add new Volunteer to a Project')
    expect(page).to have_content('Add Volunteer to any Project:')
  end
end

describe("users viewing list of projects to edit", {:type => :feature}) do
  it("allows an user to see a list of projects to edit") do
    visit('/')
    click_link('Click here to add new Project')
    fill_in('name', :with => 'project1')
    click_button("Add Project")
    visit('/')
    expect(page).to have_content('project1')
  end
end
