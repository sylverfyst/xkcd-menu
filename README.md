# XKCD 287 NP-Complete Appetizer Problem

## Given a text file with the format of

```
Order Target Price
item name,item cost$
```

find the combination of items costs' that equals the target price.

To deploy locally, make sure to edit the database.yml file to change the username to match your own.  

### Ruby Version
`2.4.1`

### Rails Version
`5.2`

## Run: 

```
gem install bundle
bundle install

rails db:create
rails db:migrate

puma
```

navigate to localhost:3000 in your browser

## To Do:
[x] Create Methods that accurately solve the problem 
[x] Create Views to allow interactivity for reusability
[x] Deploy initial application to AWS for sharing
[] Create Test Suite to verify that the application is working as expected
[] Create Pipeline to allow CI/CD between GitHub and AWS
[] Clean Up SCSS to be more generic / reusable
[] Refactor code as needed
