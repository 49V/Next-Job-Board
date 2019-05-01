# Next Canada Job Board

Ruby on Rails Web Application with a comprehensive test suite for engaging alumni to work for Next Canada ventures.

## Home Page
![HomePage](https://raw.githubusercontent.com/49V/Next-Job-Board/master/docs/HomePage.png)

## Candidates Page
![Candidates](https://raw.githubusercontent.com/49V/Next-Job-Board/master/docs/Candidates.png)

## Jobs Page
![Jobs](https://raw.githubusercontent.com/49V/Next-Job-Board/master/docs/Jobs.png)

## Dependencies

- Rails 5.1.x or above
- Ruby 2.5.x or above
- Bundler 1.17.x or above

## Getting started

# Install

1) Clone Repository

2) Install bundler
```
gem install bundler
```

After installing make sure to run:
```
rbenv rehash
```

3) Install the needed gems:

```
$ bundle install --without production
```

4) Next, migrate the database:

```
$ rails db:migrate
```

5) Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

6) If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails server
```

When signing up you will be sent an activation email. In live deployments emails will be properly sent, otherwise when running on localhost you must check '/log/development.log' for the activation email that will look similar to below and follow the link to activate your account.
```
Account Activated!

  Welcome to the Next Canada Job Portal.
  This portal allows you to find Next Alumni that are searching for a job.
  It also allows Next Alumni to find jobs, at companies run by other Next Alumni.

  Find Co-Founders, first hires, and recruit people who've already proven their drive, passion and committment to their work.

  Best of luck to you!


http://localhost:3000/account_activations/YISMM5JdB74HMt3-gRgXnA/edit?email=test%40test.com
```

Enjoy!
