require 'rails_helper'

RSpec.describe "pins/index.html.erb", type: :view do
  it "displays the home button that links to root path" do
    Pin.create(title: "title", description: "descritpion", price: 123, image: File.open(Rails.root.join("spec", "fixtures", "legomac.jpg")))
   render
    expect(rendered).to have_link("Pinteresting", href: root_path)
  end

  context "logged in" do
    it "display log out button" do
      image =
      Pin.create(title: "title", description: "descritpion", price: 123, image: File.open(Rails.root.join("spec", "fixtures", "legomac.jpg")))
      user = User.create(username: "user", email: "user@user.com", password: "password")
      session[:user_id] = user.id
      render
      expect(rendered).to have_link("Logout", href: logout_path)
    end
  end

  context "not logged in" do
    it "display log in button" do
      Pin.create(title: "title", description: "descritpion", price: 123, image: File.open(Rails.root.join("spec", "fixtures", "legomac.jpg")))
      render
      expect(rendered).to have_link("Login", href: login_path)
    end
  end

  context "looking at pins index/home page" do
    it "submits and has access to js" do
      Pin.create(title: "title", description: "descritpion", price: 123, image: File.open(Rails.root.join("spec", "fixtures", "legomac.jpg")))
      render
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
