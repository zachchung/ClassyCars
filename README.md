# ClassyCars - The Ultimate Hyper Car Rental Platform
ClassyCars is a platform that allows users to rent luxury cars for special occasions.

Check it out [here](https://beyondclassy.herokuapp.com/)

## Setup & Deployment
### Setup
Clone the project, and run on local machine
```bash
bundle install
yarn install
```

Once the project is made available on your local machine, create the database in PostgreSQL and populate structure and data.
```bash
rails db:create
rails db:migrate
```

### Deployment
Start the application with:
```bash
rails s
```
