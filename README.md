# Assignment

We're looking to add weather information for sales prediction and dynamic pricing.

Since we're using GraphQL as our main interface for internal communication, we
have to build a small proxy service to translate REST to GraphQL. We use Absinthe
within Elixir to build GraphQL APIs.

## Setup

- [Phoenix](https://phoenixframework.org) has been set up and is available to run the application server.\
  Ecto has been disabled, as you won't need a database for this service, but can be enabled later if needed.
- [Absinthe](https://hexdocs.pm/absinthe) is included for the GraphQL API.
- [Tesla](https://hexdocs.pm/tesla) is included for the REST API.
- [ExUnit](https://hexdocs.pm/ex_unit) is also set up with some scaffolding in place. You must fill this in with your own tests.

## Expected API

The way it should work is as follows:

- a user sends the GrapQL query to the server (Absinthe)
- the server send the request to the REST API from OpenWeatherMap (Tesla)
- the server responds to the user with the data from OpenWeatherMap in the GrapQL format 

You can go ahead and create your own API key on https://openweathermap.org/api/one-call-api (it’s free)

An example query and input can be found below. Think carefully of what type a field could be.

> Amsterdam: 52.3667° N, 4.8945° E

Input:

```json
{
  "input": {
    "latitude": "52.3667",
    "longitude": "4.8945"
  }
}
```

Query:

```graphql
query WeatherForecast($input: CoordinateInput!) {
  weatherForecast(input: $input) {
    date
    sunrise
    sunset
    temperature
    feelsLike
    weather {
      main
      description
    }
    daily {
      date
      pressure
      humidity
      temperature {
        day
        min
        max
        night
        evening
        morning
      }
      feelsLike {
        day
        night
        evening
        morning
      }
    }
  }
}
```
