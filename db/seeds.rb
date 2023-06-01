# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
customer1 = Customer.create!(
                  first_name: 'Shane', 
                  last_name: 'Finnegan', 
                  email: 'SFinnegan@gmail.com', 
                  address: '123 Main St'
                )
customer2 = Customer.create!(
                  first_name: 'Isaac', 
                  last_name: 'Alter', 
                  email: 'IAlter@gmail.com', 
                  address: '123 Main St'
                )
tea1 = Tea.create!(
              title: 'Green Tea',
              description: 'Green tea is made from Camellia sinensis leaves that have not undergone the same withering and oxidation applied when processing Camellia sinensis into oolong tea and black tea.',
              temperature: 180,
              brew_time: 3
            )
tea2 = Tea.create!(
              title: 'Black Tea',
              description: 'Black tea is a type of tea that is more oxidized than oolong, green, and white teas.',
              temperature: 212,
              brew_time: 5
            )
tea3 = Tea.create!(
              title: 'Oolong Tea',
              description: 'Oolong is a traditional semi-oxidized Chinese tea produced through a process including withering the plant under strong sun and oxidation before curling and twisting.',
              temperature: 190,
              brew_time: 4
            )
subscription1 = Subscription.create!(
              title: 'Green & Black Subscription',
              price: 15.99,
              status: "active",
              frequency: "one"
            )
subscription2 = Subscription.create!(
                                        title: 'Oolong & Green Subscription',
                                        price: 21.99,
                                        status: "cancelled",
                                        frequency: "one"
                                      )

teas = Tea.limit(2)
subscription1.teas << teas
subscription2.teas << [tea3, tea1]
customer2.subscriptions << [subscription1, subscription2]