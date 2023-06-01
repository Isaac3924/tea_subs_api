require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { should validate_presence_of :first_name }
    it { should validate_presence_of :last_name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :address }
  end

  describe 'relationships' do
    it { should have_many :subscriptions }
  end

  before :each do
    @customer1 = Customer.create!(
                                  first_name: 'Bob', 
                                  last_name: 'Gu', 
                                  email: 'bob@gmail.com', 
                                  address: '123 Main St'
                                )
    @customer2 = Customer.create!(
                                  first_name: 'Sue',
                                  last_name: 'Goodman',
                                  email: 'sue@gmail.com',
                                  address: '456 Main St'
                                )
    @tea1 = Tea.create!(
                        title: 'Green Tea',
                        description: 'Green tea is made from Camellia sinensis leaves that have not undergone the same withering and oxidation applied when processing Camellia sinensis into oolong tea and black tea.',
                        temperature: 180,
                        brew_time: 3
                      )
    @tea2 = Tea.create!(
                        title: 'Black Tea',
                        description: 'Black tea is a type of tea that is more oxidized than oolong, green, and white teas.',
                        temperature: 212,
                        brew_time: 5
                      )
    @tea3 = Tea.create!(
                        title: 'Oolong Tea',
                        description: 'Oolong is a traditional semi-oxidized Chinese tea produced through a process including withering the plant under strong sun and oxidation before curling and twisting.',
                        temperature: 190,
                        brew_time: 4
                      )
    @subscription1 = Subscription.create!(
                                          title: 'Green Tea Subscription',
  end
end