## LIVE CHAT APPLICATION

A Live chat using WebSocket.

Ruby Version: 2.7.2
Rails Version: 6.1.4.4


Features:
* Real time messaging chat
* Async message loading
* User authentication
* Mail notifications

## Getting Started
Follow these steps to get the project setup on your machine.

### Clone the repository
adicionar link do clone

### Run the following commands
```bash
# install yarn dependencies
yarn install

# install gems
bundle install

# setup database
bundle exec rake db:setup

# run migrations
bundle exec rake db:migrate

# seed data
bundle exec rake db:seed
```

## Requirements
In order to run this project you need to have set up on your machine the following applications:

`MySQL`

`Redis`

## How To Run
```bash
# start the server
rails s / bundle exec rails s

# start sidekiq
bundle exec sidekiq

# url
http://localhost:3000/

# sidekiq web
http://localhost:3000/sidekiq
```

## Run test suite
```bash
bundle exec rspec spec
```

## Future Improvements

ADD LOCALSTORAGE TO STORE CHANNEL ON PAGE RELOAD

ADD ABILITY TO SWITCH CHANNEL

IMPROVE CHAT LAYOUT

ADD USERNAME, MINE AND THEIRS ON CHAT

LOAD PREVIOUS MESSAGES WHEN SCROLL UP

ADD FETCH MESSAGE UNIT TO ISOLATE MESSAGES QUERY FROM CONTROLLER

IMPROVE ERROR HANDLING

CONFIGURE SMTP TO SEND EMAILS