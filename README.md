# Sweater Weather 
> A rails backend for a service oriented application. A user can request and receieve data from endpoints to plan road trips. Endpoints include querying weather forecasts for a destination, drive time between two destinations, and background image resources for the front end. 
Multiple API endpoints are consumed for each call, their data is integrated into the JSON body of sweater-weather's response. 

## Schema
```
  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "api_key"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end
```

## Design Principles: 
The design of this application relies on the facade design pattern. Here's a very high level overview: 
* A controller receives a request from the front end and intiates the creation of a facade, and passes it data(params, from JSON or query). 
* A facade is a ruby class that initializes a Service, and sends the service data to a PORO. 
* A service calls an external api enpoint(get (https://web.site?optional_param) and returns parsed JSON. 
* The parsed JSON is turned into a Ruby object through a PORO. 
* The object is serialized and sent to the route matching the controller action. 

That's a lot, right? To see it step-by-step in action, if you checkout and pull down ```pry-branch``` you can pry ever step of the way! Just exit each pry to move on when you are finished exploring each section. 

I chose to keep my POROs as close to the original JSON response as possible, but filtering out all irrelevant data. You can see an example of this in the test 
```
spec/poros/forecast_spec.rb
```

## Setup

1. clone this repository 
2. cd into 'sweater-weather' directory 
3. run ```'bundle install' to install gems```
4. run ```rake db:{drop,create,migrate,seed} to prepare the database ```
6. run ```bundle exec rspec``` to run the test suite
7. run ```rails s``` to launch the production environment
8. send requests to "https://localhost:3000". 

I reccomend using Postman for the requests, as it's easy to format a request by adding it to the "raw body" of a 
POST request. 
Never used Postman? [Check it out here.](https://www.postman.com/postman/workspace/postman-public-workspace/documentation/12959542-c8142d51-e97c-46b6-bd77-52bb66712c9a)
```
hot tip: all post requests need to be sent with the JSON raw body!
```

Here are some example endpoints. The postman tests themselves are located in the repository [here](https://www.getpostman.com/collections/a83005c3eec604349066). You can use postman to test them, or your preferred API testing service, just copy and paste the URL and JSON raw body. 

For further testing of requests, check out ```spec api/v1/requests``` for a complete list of requests and a detailed breakdown of the structure of the app's response Ruby-parsed JSON. 

### GET http://localhost:3000/api/v1/forecast?location=denver,co&Content-Type=application/json&Accept
```
Condensed Response: 

{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2022-03-08T12:31:50.000-07:00",
                "sunrise": "2022-03-08T06:22:28.000-07:00",
                "sunset": "2022-03-08T17:59:10.000-07:00",
                "temperature": 36.45,
                "feels_like": 31.53,
                "humidity": 29,
                "uvi": 3.61,
                "visibility": 10000,
                "conditions": null,
                "icon": "01d"
            },
            "daily_weather": [
                {
                    "date": "2022-03-08",
                    "sunrise": "2022-03-08T06:22:28.000-07:00",
                    "sunset": "2022-03-08T17:59:10.000-07:00",
                    "max_temp": 36.45,
                    "min_temp": 20.25,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
            ],
            "hourly_weather": [
                {
                    "time": "12:00:00",
                    "temperature": 35.62,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                {
                    "time": "13:00:00",
                    "temperature": 36.45,
                    "conditions": "clear sky",
                    "icon": "01d"
                },
                }
            ]
        }
    }
}
```
### POST http://localhost:3000/api/v1/users

```
JSON raw body:
{
  "email": "you@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
```
Response:
{
    "data": {
        "id": "2",
        "type": "users",
        "attributes": {
            "email": "chris@example.com",
            "api_key": "8a232e734270e093e960"
        }
    }
}
```
### POST http://localhost:3000/api/v1/users (sad path email taken) 
```
JSON raw body: 
{
  "email": "you@example.com",
  "password": "password",
  "password_confirmation": "password"
}
```
```
Response:
{
    "status": 400,
    "message": "Email has already been taken",
    "data": {
        "email": [
            "has already been taken"
        ]
    }
}
```

## Development setup
```ruby 2.7.2```

```rails 5.2.6```

## Gems

![pry v badge](https://img.shields.io/gem/v/pry?color=blue&label=pry)
![shoulda-matchers v badge](https://img.shields.io/gem/v/shoulda-matchers?label=shoulda-matchers)
![rspec v badge](https://img.shields.io/gem/v/rspec?color=orange&label=rspec)
![simplecov v badge](https://img.shields.io/gem/v/simplecov?color=green&label=simplecov)
]![json-apiserializer](https://img.shields.io/badge/json-apiserializer-green)

## Contributing

1. fork it (<https://github.com/Henchworm/rails-engine/fork>)
2. create your feature branch (`git checkout -b feature/myfeature`)
3. use TDD
4. commit your changes (`git commit -am 'Add new merchant'`)
5. push to the branch (`git push origin feature/myfeature`)
6. create a new pull request

## Who am I?

Chris Hewitt – [My Cool Website That's Mostly About Music](http://www.goldenbullfrog.com/) – agop5134@gmail.com


[https://github.com/Henchworm/](https://github.com/Henchworm/)


