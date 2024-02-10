require 'rails_helper'

RSpec.describe 'Adoption Application Show page', type: :feature do

   # User Story 1
   it 'has the applicant name, address, good fit and status' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Scrappy", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)
      # application = AdoptionApplication.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs")
      application = pet_2.adoption_applications.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs")

      visit "/applications/#{application.id}"

      expect(page).to have_content(application.name)
      expect(page).to have_content(application.street_address)
      expect(page).to have_content(application.city)
      expect(page).to have_content(application.state)
      expect(page).to have_content(application.zip_code)
      expect(page).to have_content(application.description)
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(application.status)
   end

   # User Story 4
   it 'has a section to add a Pet to the application' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Scrappy", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)
      application = AdoptionApplication.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs")

      visit "/applications/#{application.id}"

      expect(page).to have_content("Add Pets to this Application")
      expect(page).to have_content("Search Pet by Name")
   end

     

      # And I search for a Pet by name
      # And I see the names Pets that match my search
      # Then next to each Pet's name I see a button to "Adopt this Pet"
      # When I click one of these buttons
      # Then I am taken back to the application show page
      # And I see the Pet I want to adopt listed on this application

   # User Story 5

   it 'has a section to add a Pet to the application' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Scrappy", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)

      application = pet_2.adoption_applications.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs", status: "Pending")

      application = pet_2.adoption_applications.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs")


      visit "/applications/#{application.id}"

      expect(page).to have_content("Add Pets to this Application")
      expect(page).to have_content("Search Pet by Name")

      fill_in "search", with: "Sc"
      click_on "Search"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.breed)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.adoptable)
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.breed)
      expect(page).to have_content(pet_2.age)
      expect(page).to have_content(pet_2.adoptable)

      expect(page).to have_button("Adopt this Pet")
   end

   
   # User Story 8
   it 'is has partial matches' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Scrappy", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)
      application = pet_2.adoption_applications.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs", status: "Pending")

      visit "/applications/#{application.id}"

      expect(page).to have_content("Add Pets to this Application")
      expect(page).to have_content("Search Pet by Name")

      fill_in "search", with: "sc"
      click_on "Search"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.breed)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.adoptable)
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.breed)
      expect(page).to have_content(pet_2.age)
      expect(page).to have_content(pet_2.adoptable)

      expect(page).to have_button("Adopt this Pet")
   end

   it 'is has partial matches' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "SCOOBY", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "ScRaPpY", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)
      application = pet_2.adoption_applications.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs", status: "Pending")

      visit "/applications/#{application.id}"

      expect(page).to have_content("Add Pets to this Application")
      expect(page).to have_content("Search Pet by Name")

      fill_in "search", with: "sc"
      click_on "Search"

      expect(page).to have_content(pet_1.name)
      expect(page).to have_content(pet_1.breed)
      expect(page).to have_content(pet_1.age)
      expect(page).to have_content(pet_1.adoptable)
      expect(page).to have_content(pet_2.name)
      expect(page).to have_content(pet_2.breed)
      expect(page).to have_content(pet_2.age)
      expect(page).to have_content(pet_2.adoptable)

      expect(page).to have_button("Adopt this Pet")
   end   


   it 'shows added pets to the application' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Scrappy", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)
      application = pet_2.adoption_applications.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs")

      visit "/applications/#{application.id}"

      fill_in "search", with: "scrap"
      click_button "Search"
      click_button "Adopt this Pet"

      visit "/applications/#{application.id}"
      fill_in "search", with: "z"

      expect(page).to have_content(pet_2.name)
   end

   it 'does not show a section to explain why I would be a good owner to this pet if I do not have any pet added' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Scrappy", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)
      application = pet_2.adoption_applications.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs")

      visit "/applications/#{application.id}"

      expect(page).to have_content("Why would you be a good owner to the pet(s)?")
   end

   it 'does not show a section to explain why I would be a good owner to this pet if I do not have any pet added' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Scrappy", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)
      application = AdoptionApplication.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs")

      visit "/applications/#{application.id}"

      expect(page).to_not have_content("Why would you be a good owner to the pet(s)?")
   end

   it 'changes the status to pending once you submit your application' do
      shelter = Shelter.create(name: "Mystery Building", city: "Irvine CA", foster_program: false, rank: 9)
      pet_1 = Pet.create(name: "Scooby", age: 2, breed: "Great Dane", adoptable: true, shelter_id: shelter.id)
      pet_2 = Pet.create(name: "Scrappy", age: 1, breed: "Pit Mix", adoptable: true, shelter_id: shelter.id)
      application = pet_2.adoption_applications.create!(name: "Mel", street_address: "23 Main St", city: "Denver", state: "CO", zip_code: 80303, description: "I have a fenced backyard and love dogs")

      visit "/applications/#{application.id}"

      expect(application.status).to eq("In Progress")

      fill_in "ownership_description", with: "Because I love pits"
      click_button "Submit Application"

      expect(page).to have_content("Status: Pending")
   end
end