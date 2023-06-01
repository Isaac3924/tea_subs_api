# tea_subs_api
tea_subs_api is a back end application api that manages the subscriptions statues of customers and tea flavors within said subscriptions. It holds three endpoints currently that allows a front end user to call on them with provided information and see a proper return. This README will provide needed information to use this API as intended.
## Features
### Road Trip
* Receives incoming data
* Returns incoming data in specific format
* Returns a JSON payload in the body of the request
## Setup
1. Clone this repository to your local machine: **'git@github.com:Isaac3924/2211_Whether-Sweater-Final-Project.git'**
2. Install dependencies: **'bundle install'**
3. Configure the database by running **'rails db:setup'**
4. Seed the database by running **'rails db:seed'**
5. Start the server by running **'rails server'**
6. Visit **'http://localhost:3000'** in your web browser to confirm that the app is running.
7. The API endpoints available are  **'http://localhost:3000/api/v1/subscriptions/1'**, **'http://localhost:3000/api/v1/subscriptions?customer_id=2'**, and **'http://localhost:3000/api/v1/subscriptions'**. 
8. Use Postman to test the FIRST TWO endpoints as is for responses. The database should seed with the needed data in order to receive a json in return.
9. For the third endpoint, , you will need to provide a JSON body to receive a response. The expected format for the body is as follows:
```json
{
    "customer_id": 1,
    "subscriptions": {
        "title": "Example Subscription",
        "price": 178.99,
        "status": "active",
        "frequency": "Time is not a one way street",
        "tea_ids": [1, 2, 3]
    }
}
```

## Testing
To run the tests, use the **'rspec'** command. Using simplecov, current coverage of code is at 100%.

## Future Features and Refactors
* Endpoint to create Customers

* Endpoint to create Tea

* Authorization

* API_key

* Further validations for data types