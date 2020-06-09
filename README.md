# Sweater Weather
Sweater Weather is an API built on Rails that provides current weather as well as forecasted weather for a given destination. 

## Test Deployment
The API can be reached here: https://sweater-weather-2001.herokuapp.com/

## Setup 
### Versions
- Ruby 2.5.3
- Rails 5.1.7

### Install
```shell
$ git clone git@github.com:javier-aguilar/sweater-weather.git
$ cd sweater-weather
$ bundle install
$ rails db:{create,migrate}
$ bundle exec figaro install
$ echo GOOGLE_API_KEY: <Your_Google_API_Key> >> config/application.yml
$ echo OWEATHER_API_KEY: <Your_OpenWeather_API_Key> >> config/application.yml
$ echo UNSPLASH_ACCESS_KEY: <Your_UNSPLASH_ACCESS_KEY> >> config/application.yml
$ echo UNSPLASH_SECRET_KEY: <Your_UNSPLASH_SECRET_KEY> >> config/application.yml
$ rails s
```

## API Documentation

### Get Weather Forecast For A City
```shell
GET /api/v1/forecast
```
Example:
```shell
GET /api/v1/forecast?location=houston,tx
```
#### Params
|         |            |
| ------------- |:-------------:|
| **location**     | city |


### Get Background Image For A City
```shell
GET /api/v1/backgrounds
```
Example:
```shell
GET /api/v1/backgrounds?location=denver,co
```
#### Params
|         |            |
| ------------- |:-------------:|
| **location**     | city |


### Create User Account
```shell
POST /api/v1/users
```
Example:
```
POST /api/v1/users?email=user@example.com&password=password123&password_confirmation=password123
```
#### Params
|         |            |
| ------------- |:-------------:|
| **email**     | user@example.com |
| **password**      | password        |
| **password_confirmation** | password        |

### Create User Session
```shell
POST /api/v1/sessions
```
Example:
```
POST /api/v1/sessions?email=user@example.com&password=password123
```
#### Params
|         |            |
| ------------- |:-------------:|
| **email**     | user@example.com |
| **password**      | password        |

### Create Road Trip For A User
```shell
POST /api/v1/road_trip
```
Example:
```
POST /api/v1/road_trip?origin=denver,co&destination=pueblo,co&api_key=abc123
```
#### Params
|         |            |
| ------------- |:-------------:|
| **origin**     | city |
| **destination**      | city        |
| **api_key** | api_key        |
