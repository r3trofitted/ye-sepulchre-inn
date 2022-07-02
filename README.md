# Ye Sepulchre Inn
**Ye Sepulchre Inn** is the web adaptation of the board game [_La Taverne de la Crypte_](https://boardgamegeek.com/boardgame/19697/taverne-de-la-crypte). 

It is an easy-to-grasp and fast-to-play game for 3 to 5 (or more!) players that recreates a fantasy tavern brawl. 
Colorful characters throw punches, pints, chairs and occasionally waitresses at each other, hoping to be the last person standing when the town militia arrives.

## Getting Started
These instructions will get you a copy of the project up and running on your local machine for development and 
testing purposes. See deployment for notes on how to deploy the project on a live system.

### Prerequisites
Ye Sepulchre Inn is a basic Rails 7 app; everything you need is covered in the excellent 
[Rails guides](https://guides.rubyonrails.org/getting_started.html#creating-a-new-rails-project-installing-rails).

### Installing
Rails comes with a simple `bin/setup` script that will install everything for you – just run it.
Should you want to do everything yourself, all you have to do is install the dependencies and 
set up the database.

```
bundle install
bin/rails db:prepare
```

I personally find the [testing fixtures](https://guides.rubyonrails.org/testing.html#the-low-down-on-fixtures) 
useful in development. Loading them will get you up and running faster.

```
bin/rails db:fixtures:load
```

Now you can launch the server and invite your friends to play!

```
bin/rails server
```

## Running the tests
Once again, pretty [standard Rails stuff](https://guides.rubyonrails.org/testing.html).

I really like the [testing pyramid](https://martinfowler.com/bliki/TestPyramid.html), and I really, really like to focus 
exclusively on its top and bottom, 
[as do people smarter than me](https://github.com/testdouble/contributing-tests/wiki/Testing-Pyramid).

### System tests
The top of the pyramid. Since Rails 5.1, they are easy to make and 
[well explained](https://guides.rubyonrails.org/testing.html#system-testing).

```
bin/rais test:system
```

### Unit tests
The bottom of the pyramid. For this project, they are mostly synonymous with 
[model testing](https://guides.rubyonrails.org/testing.html#model-testing).

```
bin/rails test
```

### Everything at once
```
bin/rails test:all
````

## Deployment
[TODO]

## Built With

* [Ruby On Rails](https://rubyonrails.org) - Duh

## Contributing
[TODO]

## Acknowledgments

* PurpleBooth for her cool [README template](https://gist.github.com/PurpleBooth/109311bb0361f32d87a2)
