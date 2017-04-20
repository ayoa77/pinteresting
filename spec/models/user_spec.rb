require 'rails_helper'

RSpec.describe User, type: :model do
  let(:proper_email)       { 'taco@email.com' }
  let(:proper_username) { 'taco' }
  let(:proper_password)       { '12345abcd' }
  let(:improper_password1)     { '1234567890qwertyuiop1234567'}
  let(:improper_password2)     { '123'}

context "validation: " do
  it { is_expected.to validate_uniqueness_of(:username)}
  it { is_expected.to validate_uniqueness_of(:email)}
  it { is_expected.to validate_presence_of(:username)}
  it { is_expected.to validate_presence_of(:email)}
  it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(24)}


end
  context "creates: " do
    it "takes proper username, email and password to create a user" do
      expect{ User.create(username: proper_username, email: proper_email, password: proper_password) }.not_to raise_error
    end

		it "creates an entry when all three proper inputs are being supplied" do
      User.create(username: proper_username, email: proper_email, password: proper_password)
      expect( User.find_by(username: proper_username, email: proper_email) ).not_to be nil
    end

    it "won't create an entry if only one or valid attribute is being supplied" do
      User.create(username: proper_username, email: proper_email)
      expect( User.find_by(username: proper_username, email: proper_email) ).to be nil
		end

    it "won't create an entry if only one or valid attribute is being supplied" do
      User.create(email: proper_username, password: proper_password)
      expect( User.find_by(email: proper_email) ).to be nil
    end

    it "won't create an entry if only one or valid attribute is being supplied" do
      User.create(username: proper_username, password: proper_password)
      expect( User.find_by(username: proper_username) ).to be nil
    end

    end
end
