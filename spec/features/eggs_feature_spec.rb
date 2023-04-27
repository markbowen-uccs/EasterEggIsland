require "rails_helper"




RSpec.feature "Eggs", type: :feature do

    context "Login" do
        scenario "should sign up" do
          visit root_path
          click_link 'Sign up'
          within("form") do
            fill_in "Email", with: "testing@test.com"
            fill_in "Password", with: "123456"
            fill_in "Password confirmation", with: "123456"
            click_button "Sign up"
          end
          expect(page).to have_content("Welcome! You have signed up successfully.")
        end
        
        
        scenario "should log in" do
          user = FactoryBot.create(:user)
          login_as(user)
          visit root_path
          expect(page).to have_content("Logged in")
        end
    end

    context "Update egg" do
      let(:egg) { Egg.create(title: "Test title", game: "Test Game Name") }
      before(:each) do
        user = FactoryBot.create(:user)
        login_as(user)
        visit edit_egg_path(egg)
      end
 
      scenario "should be successful" do
        within("form") do
          fill_in "Game", with: "New Game Name"
        end
        click_button "Update Egg"
        expect(page).to have_content("Egg was successfully updated")
      end
 
      scenario "should fail" do
        within("form") do
          fill_in "Game", with: ""
        end
        click_button "Update Egg"
        expect(page).to have_content("Game can't be blank")
      end


      scenario "should be successful" do
        within("form") do
          fill_in "Title", with: "New title"
        end
        click_button "Update Egg"
        expect(page).to have_content("Egg was successfully updated")
      end
 
      scenario "should fail" do
        within("form") do
          fill_in "Title", with: ""
        end
        click_button "Update Egg"
        expect(page).to have_content("Title can't be blank")
      end
    end

    context "Create egg" do
        before(:each) do
            user = FactoryBot.create(:user)
            login_as(user)
            visit new_egg_path
        end
   
        scenario "should be successful" do
          within("form") do
            fill_in "Title", with: "Title"
            fill_in "Game", with: "Game Name"
          end
          click_button "Create Egg"
          expect(page).to have_content("Egg was successfully created")
        end
   
        scenario "should fail" do
            within("form") do
              fill_in "Game", with: ""
            end
            click_button "Create Egg"
            expect(page).to have_content("Game can't be blank")
        end
   
        scenario "should be successful" do
            within("form") do
              fill_in "Title", with: "Title"
              fill_in "Game", with: "Game Name"
            end
            click_button "Create Egg"
            expect(page).to have_content("Egg was successfully created")
        end
     
        scenario "should fail" do
            within("form") do
              fill_in "Title", with: ""
            end
            click_button "Create Egg"
            expect(page).to have_content("Title can't be blank")
        end
    end

end
