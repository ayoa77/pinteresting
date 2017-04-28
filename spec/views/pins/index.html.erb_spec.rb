require 'rails_helper'

feature "index page" do
  background do
    Pin.create(title: "title", description: "descritpion", price: 123, image: File.open(Rails.root.join("spec", "fixtures", "legomac.jpg")))
  end

  visit 'pins/index'
  within('pins#index') do
  it "displays the home button that links to root path" do
    expect(rendered).to have_link("Pinteresting", href: root_path)
  end

  context "logged in" do
    visit 'pins/index'
    it "display log out button" do
      Pin.create(title: "title", description: "descritpion", price: 123, image: File.open(Rails.root.join("spec", "fixtures", "legomac.jpg")))
      user = User.create(username: "user", email: "user@user.com", password: "password")
      session[:user_id] = user.id
      expect(rendered).to have_link("Logout", href: logout_path)
    end
  end

  context "not logged in" do
    visit 'pins/index'
    it "display log in button" do
      Pin.create(title: "title", description: "descritpion", price: 123, image: File.open(Rails.root.join("spec", "fixtures", "legomac.jpg")))
      expect(rendered).to have_link("Login", href: login_path)
    end
  end

  context "looking at pins index/home page" do
    visit 'pins/index'
    it "submits and has access to js" do
      Pin.create(title: "title", description: "descritpion", price: 123, image: File.open(Rails.root.join("spec", "fixtures", "legomac.jpg")))
      click_button "New Pin"
      fill_in "title", :with => "pin test"
      fill_in "description", :with => "pin test"
      fill_in "price", :with => 1234
      attach_file('Image', '/spec/features/legomac.jpg')
   # save_and_open_page

   page.should have_content("pin test")
 end
end
end
