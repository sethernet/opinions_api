# Opinions API

###### About
* Ruby on Rails project that will get and parse opinions from Debate.org

###### Prerequisites
* Ruby version: '2.3.7'
* Rails version '5.2.2'

###### App Setup
* At the root of the project run:
    - bundle install

###### Run the App
* rails s

###### Usage
* Navigate to http://localhost:3000/opinions
* This endpoint takes a query param in the form of: ?query={URL}
* A valid query param is an opinion url from Debate.org (https://www.debate.org/opinions/graduated-from-the-top-university-means-you-are-success)
* Ex.: 
    - http://localhost:3000/opinions?query=https://www.debate.org/opinions/graduated-from-the-top-university-means-you-are-success
    - hitting this url will parse the page into opinion title, percentage of "yes" votes, percentage of "no" votes,
        all yes and no arguments made on that opinion and the author of the argument
        
###### How to run the test suite
* rails test

