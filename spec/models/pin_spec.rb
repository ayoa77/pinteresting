require 'rails_helper'

RSpec.describe Pin, type: :model do
  let(:proper_title)       { 'title' }
  let(:proper_description) { 'description' }
  let(:proper_price)       { 123 }
  let(:proper_image)       { IO.read(Rails.root.join("spec", "fixtures", "legomac.jpg")) }
  let(:improper_image)     { IO.read(Rails.root.join("spec", "fixtures", "image.pdf")) }

context "validation: " do
  it { is_expected.to validate_presence_of(:title)}
  it { is_expected.to validate_presence_of(:image)}
  it { is_expected.to allow_value(proper_image).for(:image)}
  it { is_expected.not_to allow_value(improper_image).for(:image)}
end
  context "creates: " do
    it "creates pin with proper title and proper image" do
      expect{ Pin.create(title: proper_title, image: proper_image) }.not_to raise_error
    end

		it "creates an entry when two proper inputs are being supplied" do
			Pin.create(title: proper_title, image: proper_image)
			expect( Pin.find_by(title: proper_title) ).not_to be nil
    end

    it "won't create an entry if only one valid attribute is being supplied" do
			Pin.create(title: proper_title)
			expect( Pin.find_by(title: proper_title) ).to be nil
		end

    end
end
