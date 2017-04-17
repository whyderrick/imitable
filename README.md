# Imitable
Imitable is a complementary program to [Submittable](https://submittable.com).
With Submittable, tracking a submission is easy, but tracking its constituent
parts isn't. Imitable is designed to address that gap.

This is a breakable toy built during my Apprenticeship at thoughtbot. The
primary goal is to build around sound TDD principles in a way that allows
functionality to expand beyond a basic Rails app. 

Trello board for the project lives [here](https://trello.com/b/eV3O9qFw).

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production
