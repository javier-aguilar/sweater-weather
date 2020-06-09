# Sweater Weather
Sweater Weather is an API built on Rails that provides current weather as well as forecasted weather for a given destination. 

## Test Deployment
The API can be reached here: https://sweater-weather-2001.herokuapp.com/

## Setup 
### Versions
- Ruby 2.5.3
- Rails 5.1.7

### Generate API Keys
- [Google API Key](https://developers.google.com/maps/documentation/directions/get-api-key) (Enable Directions and Geocoding API)
- [Unsplash API Key](https://unsplash.com/developers)
- [OpenWeather API Key](https://openweathermap.org/api)

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
Returns weather forecast for a city
```shell
GET /api/v1/forecast
```
Example:
```shell
GET /api/v1/forecast?location=houston,tx
```
#### Required Params
|         |            |
| ------------- |:-------------:|
| **location**     | city |


### Get Background Image For A City
Returns an image url for a city
```shell
GET /api/v1/backgrounds
```
Example:
```shell
GET /api/v1/backgrounds?location=denver,co
```
#### Required Params
|         |            |
| ------------- |:-------------:|
| **location**     | city |


### User Account Creation
Creates a user account
```shell
POST /api/v1/users
```
Example:
```
POST /api/v1/users?email=user@example.com&password=password123&password_confirmation=password123
```
#### Required Params
|         |            |
| ------------- |:-------------:|
| **email**     | user@example.com |
| **password**      | password        |
| **password_confirmation** | password        |

### User Login
Returns user API key 
```shell
POST /api/v1/sessions
```
Example:
```
POST /api/v1/sessions?email=user@example.com&password=password123
```
#### Required Params
|         |            |
| ------------- |:-------------:|
| **email**     | user@example.com |
| **password**      | password        |

### Get Road Trip Information
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
