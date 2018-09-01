# Customer Records

## Challenge
We have some customer records in a text file (customers.txt) -- one customer per line, JSON lines formatted. We want to invite any customer within 100km of our Dublin office for some food and drinks on us. Write a program that will read the full list of customers and output the names and user ids of matching customers (within 100km), sorted by User ID (ascending).

- You can use the first formula from this Wikipedia article to calculate distance. 
Don't forget, you'll need to convert degrees to radians.
- The GPS coordinates for our Dublin office are 53.339428, -6.257664.
- You can find the Customer list here.

## Getting Started
#### Prerequisites
- [Docker](https://www.docker.com/)

### Installing
```
$ git clone 'https://github.com/renington/invite_customers.git'
$ cd invite_customers
$ docker-compose up --build
```
### Running app
```
docker-compose run --rm app ruby app.rb
```

## Running the tests
```
docker-compose run --rm app rspec
```

## Built With

* [Docker](http://www.dropwizard.io/1.0.2/docs/) - Development environment
* [Ruby](https://www.ruby-lang.org/) - The language 
* [Bundler](https://bundler.io/) - Dependency Management
* [RSPEC](https://rspec.info/) - The Test tool 
