# Next Canada Job Board

Ruby on Rails Web Application with a comprehensive test suite for engaging alumni to work for Next Canada ventures.

## Dependencies

Rails 5.1.x or above
Ruby 2.5.x or above
Bundler 1.17.x or above

## Getting started

(OPTIONAL) If you need to install Ruby and Rails, get started with the app install rbenv and ruby-build

```
cd
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
exec $SHELL

git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"' >> ~/.bashrc
exec $SHELL

rbenv install 2.6.1
rbenv global 2.6.1
```

Make sure everything installed properly
```
ruby -v
```
(OPTIONAL) Then install rails
```
gem install rails
```

Make sure Rails installed properly
```
rails -v
```

Otherwise start with cloning the repo and changing into the appropriate directory.

Next you should install bundler
```
gem install bundler
```

After installing make sure to run:
```
rbenv rehash
```

and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app in a local server:

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
