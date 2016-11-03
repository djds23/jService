##jService

###Demo
View a working demo at http://jservice.io

###Installation
* clone this repo 
* In terminal, cd into the directory you cloned into
* run `bundle install` 
* run `rails s`
* Either import the db (included) or run `rake get_clues[1,31]` -- NOTE: this will grab approx 130K clues and takes a while. The arguments here are the range of season you want to grab. You can save some time and grab only current season by doing something like `rake get_clues[20,31]`, which would only get seasons 20 through 31
* visit `http://localhost:3000/clues` or view `config\routes.rb` file for more
* shoot me a pull request to the readme with your app in the wild!

###Deployment to Ubuntu
* install RVM `gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
\curl -sSL https://get.rvm.io | bash -s stable --rails`
* clone this repo
* `apt-get install libpq-dev`
* `apt-get install postgresql`
* `apt-get install postgresql-contrib`
* `gem install pg -v '0.12.2' -- --with-pg-config=/usr/bin/pg_config`j
* `bundle`
* create steveo superuser in postgresql
* [ensure auth is set to md5](http://stackoverflow.com/questions/18664074/getting-error-peer-authentication-failed-for-user-postgres-when-trying-to-ge)
* `rake db:create && rake db:migrate`

###jService in the wild
* [jService Twitter Bot](http://twitter.com/jservicebot)
* [TrebekBot for Slack](https://github.com/gesteves/trebekbot)
* [Trebek for HipChat](https://github.com/yanigisawa/hip-trebek)
* [jApi - ruby gem for jService](https://github.com/djds23/jApi)
