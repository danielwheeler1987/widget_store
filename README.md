# Widget store

Welcome to the widget store. This is a very bare bones example of a store that sells useless widgets. This application contains both a customer store and an administrative portal. 

## Production
If you woudl like to view this site in production then go to the following url https://facet-wealth-widget-store.herokuapp.com/

- This application is currently deployed to heroku

## Development
If you would like to setup this application locally then please following the below steps:

- ruby version 2.2.2
- rails version 5.2.0
- PostgreSQL must be installed locally
- After checking out the repo, run `bin/setup` to install dependencies and seed the database with fake widget information.
- You can also run `bin/console` for an interactive prompt that will allow you to experiment.
- To sping the server up run `rails s`. This will default to http://localhost:3000. In addition, the root path is the customer facing store.
- You can also run `bin/rake test` to see the results from the test suite. Unfourtantely the test coverage isn't great at this point. At this point the primary controllers have decent coverage.

## Overview

This application was built using the following technologies/tools:

- ROR (Ruby on Rails). I used ruby on rails for this project since it fell right in line with what ROR was created for.
- SASS
- PostgreSQL
- Bootstrap... I usually try to stay away from bootstrap since it isn't semenatic and create a hot mess in you markup. However, in order to wrap this up quicky I surrendered to the bootstrap man.
- Faker
- Kaminari Pagination
- Jquery Rails... Dependencey for the bootstrap gem


In general this application is a pure ROR application. I utilized the MVC frameworks tools such as models, controllers, views, helpers, and routes to spin up this application quickly.

## Widget Store

The widget store set to the root path of the application. I did this since the customer facing section seemed the most relevant. The store layout is a basic two column responsive layout. The left side contains the search options (search by name, search by color, search by size, search by category). While the right side contains the available options based of the search options. If no search options are provided then the customer will see the entire set of available widgets (widgets that have a positive inventory). Below the avaiaible widgets live the pagination options. I utilized a rails gem to spin up this pagination shortly. I highly recommend taking a look at the default scope and scopes on the widget model to get a better idea of the searchable behavior.

## Widget Admin Portal

The widget admin portal is located at /widgets. This tool allows administrative users to view all widgets, add new widgets, update attributes on preexisting widgets, and remove widgets. When creating and updating a widget you have the ability to select a color, category, and size. For simplicity I made a safe assumption that all widgets can possibly be created with all the same colors, sizes, and categories. I think this isn't the best implementation for an application that hopes to scale.

## Endpoint(API) Documentation

- `GET /widgets`
  - Returns and array of widgets
- `GET /widgets/{id}`
  - Returns a specific widget
- `POST /widgets`
  - Creates a new widget
  - Accepts a JSON body
- `PATCH /widgets/{id}`
  - Updates a existing widget
  - Accepts a JSON body
- `DELETE /widgets/{id}`
  - Deletes an existing widget.

- `GET /sizes`
  - Returns and array of sizes
- `GET /sizes/{id}`
  - Returns a specific size
- `POST /sizes`
  - Creates a new size
  - Accepts a JSON body
- `PATCH /sizes/{id}`
  - Updates a existing size
  - Accepts a JSON body
- `DELETE /sizes/{id}`
  - Deletes an existing size.
  - Can't be removed if attached to a widget

- `GET /colors`
  - Returns and array of colors
- `GET /colors/{id}`
  - Returns a specific color
- `POST /colors`
  - Creates a new color
  - Accepts a JSON body
- `PATCH /colors/{id}`
  - Updates a existing color
  - Accepts a JSON body
- `DELETE /colors/{id}`
  - Deletes an existing color.
  - Can't be removed if attached to a widget


- `GET /categories`
  - Returns and array of categories
- `GET /categories/{id}`
  - Returns a specific category
- `POST /categories`
  - Creates a new category
  - Accepts a JSON body
- `PATCH /categories/{id}`
  - Updates a existing category
  - Accepts a JSON body
- `DELETE /categories/{id}`
  - Deletes an existing category.
  - Can't be removed if attached to a widget

## Areas for Improvement

- The endpoints should be namespaced under `api/` and handle versioning as well.
- Implement api clients to interacting with endpoints instead of intracting with the controllers directly.
- Test coverage (unit, system, an controller level)
- The relationship that colors, sizes, and categories has with widgets isn't the best. I implemented it inthis fashion for simplicity. However, instead a widget should have many colors, sizes, and categories.
- The UI is gross and needs a lot of work.
- The views contain to much logic and need more frontend presenter objects
- The cart strategy isn't the best either. We shouldn't be adding the order items into the database until the customer actually finalizes the checkout. Otherwise we can end up with alot of orphaned orders and order items when sessions expire. In addition, limiting the database writes and reads would also be beneficial.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
