require 'rails_helper'

RSpec.describe Customer, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:address) }
  end

  describe 'relationships' do
    it { should have_and_belong_to_many :subscriptions }
  end

  before :each do
    # Create customers to test
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
    # Create teas to test
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
    # Create subscriptions to test
    @subscription1 = Subscription.create!(
                                          title: 'Green & Black Subscription',
                                          price: 15.99,
                                          status: "active",
                                          frequency: 1
                                        )
    @subscription2 = Subscription.create!(
                                          title: 'Oolong & Green Subscription',
                                          price: 21.99,
                                          status: "cancelled",
                                          frequency: 1
                                        )
    @subscription3 = Subscription.create!(
                                          title: 'All Three Subscription',
                                          price: 1.99,
                                          status: "active",
                                          frequency: 1
                                        )
    # Assign teas to subscriptions
    @subscription1.teas << [@tea1, @tea2]
    @subscription2.teas << [@tea3, @tea1]
    @subscription3.teas << [@tea1, @tea2, @tea3]

    # Assign subscriptions to customers
    @customer1.subscriptions << [@subscription1, @subscription2]
    @customer2.subscriptions << [@subscription3]
  end
end