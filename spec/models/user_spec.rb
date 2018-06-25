require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new first_name: "Anything", last_name: "Anything", email: "abc123@abc123.com", password: "Anything"}


  context "Relationships:" do 
    
    it { is_expected.to have_many(:reviews) }
    it { is_expected.to validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).case_insensitive }
    it { is_expected.to validate_presence_of(:password).ignoring_interference_by_writer }
    it { should_not allow_value("blahblah").for(:email) }
    it { should validate_length_of(:password).is_at_least(5) }

  end  

  describe 'Validations' do
    it { should_not allow_value("   a@a.com   ").for(:email) }
    it { should_not allow_value("   EXAMPLe@DOMAIN.CoM   ").for(:email) }
    
  end

  describe '.authenticate_with_credentials' do

    
    it 'authenticates user' do
      auser = User.create(
        first_name: "Anything",
        last_name: "Anything",
        email: "abcde@a.com",
        password: "aaaaa"
      )
      expect(User.authenticate_with_credentials('   aasdas@aasdasd.coasdasdm   ', 'aaaaaaaa')).to eq(false)
      expect(User.authenticate_with_credentials('abcde@a.com', 'aaaaa')).to eq(auser)
    end

    
  end

end
