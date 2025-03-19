# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

For my Final Project, I decided to create a social media clone that allows users to
1. Sign up
2. Sign up with X
2. Create Posts
3. Comment on Posts
4. Like Posts
5. Follow other Users

The first challenge I faced was using OmniAuth. For half of my first day, I followed tutorials
and Googled all over the internet to get it to work. It still didn't.

Another challenge was creating comments. I found it easy to create the comments, using a form on the posts
page. However, the problem I encountered was with validation. What happens when a user enters a blank comment?
I tried the normal method of render :new, status: :unprocessable_entity. But since the comments don't have their 
own page, that didn't work. I settled for redirecting the user back to the index page, but I will look to change this
to a render in the future.
