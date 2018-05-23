# Online Censorship #
Built using:
- Ruby on Rails version 4.1.2
- Ruby version 2.2.0
- Rails jQuery
- SASS


# Install the environment #

## Install [Homebrew](http://brew.sh/) (OS X) ##

Homebrew is the best package manager out there for OS X.

```
#!ruby

ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
```

## Install Ruby ##

We recommend you to use one of the Ruby version control. We mainly use Ruby 2.2.0.

### Install rbenv a Ruby version manager (with Homebrew) ###

```
#!ruby
brew install openssl

brew install ruby-build

brew install rbenv # Follow the instructions after installing rbenv

brew install rbenv-gemset
```

### Install Ruby 2.2.0 ###

```
#!ruby
rbenv install 2.2.0
```

## Install MySql ##

```
#!ruby
brew install mysql

#Start mysql server
mysql.server start
```

# Clone OC to your machine #

```
#!ruby
git clone git@bitbucket.org:thaber/oc.git
```

## Run bundle ##

```
#!ruby
bundle install
```

## Create secrets file ##
```
cp application.yml.example application.yml
```

## Database Creation ##

```
#!ruby
cp config/database.yml.example config/database.yml
bundle exec rake db:create
bundle exec rake db:migrate
# Seed the Database with some test data.
bundle exec rake db:seed
```

# Run the Server #

## Start rails server ##

```
#!ruby
rails s
```

## On the browser ##

http://localhost:3000

__________

# Contributing / Add new feature or improvment #

* Before this, make sure you have pulled the latest code from master branch

Let's say you want to contribute with XYZ feature, for your local repository create a branch for this feature

```
#!ruby
# You are on master
git branch xyz
git checkout xyz
```

After implementing the feature, push it.

```
#!ruby
git add .
git commit -m "feature XYZ"
git push origin xyz
```
Then open a pull request so we get notified for the feature you've implemented.

If there is any conflict:
```
#!ruby
git checkout master # switch to master branch
git pull # make sure it's up to date
git checkout your_branch # switch back to your branch
git merge master # or the branch you want to merge with
```
Resolve conflicts and push


If you want to get back to old branch and continue working on it:
```
#!ruby
git checkout master # switch to master branch
git pull # make sure it's up to date
git checkout your_branch # switch back to your branch
git merge master
git push # now your branch is up to date
```
