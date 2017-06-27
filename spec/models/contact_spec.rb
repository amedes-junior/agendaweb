require 'rails_helper'

RSpec.describe Contact, type: :model do
  it "should have a factory" do
    expect(FactoryGirl.build(:contact)).to be_valid
  end

  context "Associoations" do
    it { should belong_to(:user) }
  end

  context "Should raise an error without name" do
    it "with name" do
      contact = FactoryGirl.build(:contact)
      contact.name = nil
      expect(contact.valid?).to be_falsey
    end

    it "return a message: 'não pode ficar em branco'" do
      contact = FactoryGirl.build(:contact)
      contact.name = nil
      contact.save
      expect(contact.errors.messages[:name]).to include("não pode ficar em branco")
    end
  end

  context "Should Respond" do
    it { should respond_to(:name) }
    it { should respond_to(:email) }
    it { should respond_to(:cellphone) }
    it { should respond_to(:address) }
    it { should respond_to(:birthdate) }
    it { should respond_to(:gender) }
  end

  context "Validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:cellphone) }
    it { should validate_presence_of(:birthdate) }
    it { should validate_presence_of(:gender) }
  end

  context "Scopes" do
     it "Should return all male and female people" do

       males_count = rand(10)
       females_count = rand(10)

       male = FactoryGirl.create_list(:contact, males_count, gender: "M")
       female = FactoryGirl.create_list(:contact, females_count, gender: "F")

       expect(Contact.count_all_males).to eq(males_count)
       expect(Contact.count_all_females).to eq(females_count)
    end
  end

end
