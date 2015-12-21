# Alert-Me

Alert-me is a simple app that helps me to automate checking the prices for stuff
that I like.

### This is how it works:

There is a rake task that runs daily that visits the page with the product that I want using Capybara/Poltergeist, store the prices in MongoDB document.

If the price is less than the day before it will send an email alerting this.
It has a simple dashboard where I display the records from each day in a Sinatra App.

[DEMO](http://alert-me-dell.herokuapp.com/)
