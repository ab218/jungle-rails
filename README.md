# Jungle

A mini e-commerce application built with Rails 4.2 for purposes of teaching Rails by example.


##Heroku
https://peaceful-wave-44116.herokuapp.com/

##Screenshots

![Alt text](https://github.com/ab218/jungle-rails/blob/master/Screen%20Shot%202018-06-23%20at%2010.43.44%20PM.png)
![Alt text](https://github.com/ab218/jungle-rails/blob/master/Screen%20Shot%202018-06-23%20at%2010.44.42%20PM.png)
![Alt text](https://github.com/ab218/jungle-rails/blob/master/Screen%20Shot%202018-06-23%20at%2010.44.48%20PM.png)
![Alt text](https://github.com/ab218/jungle-rails/blob/master/Screen%20Shot%202018-06-23%20at%2010.44.59%20PM.png)
![Alt text](https://github.com/ab218/jungle-rails/blob/master/Screen%20Shot%202018-06-23%20at%2010.45.24%20PM.png)


## Setup

1. Fork & Clone
2. Run `bundle install` to install dependencies
3. Create `config/database.yml` by copying `config/database.example.yml`
4. Create `config/secrets.yml` by copying `config/secrets.example.yml`
5. Run `bin/rake db:reset` to create, load and seed db
6. Create .env file based on .env.example
7. Sign up for a Stripe account
8. Put Stripe (test) keys into appropriate .env vars
9. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
