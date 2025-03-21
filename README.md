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


The next error was similar to the last one, but it affected both the comments and the likes. When a user liked or commented on a post, I did not want to redirect away from the current page. However, I added the ability to like and comment on both the Posts index page and the Show page. So, i added another value to each form, one that specified which page the form came from. Then, I used an if statement in the controller action to adjust the redirect statement depending on which page the user was on.


My first attempt at OmniAuth was with X, which failed miserably. And then, I tried a brief stint with Github which went about the same way. Then, I decided to follow a video from Deanin on using OmniAuth with Devise in Rails. After completing the whole project exactly the same, I found myself with a 401 Unauthorized status. Through the server logs, I noticed that a user was being created, and that I could access the elements of this instance. I tried messing around with the code, but nothing seemed to fix it. And so, I went to sleep. And then, I took a day off, no coding.
I came back the next day determined. I found a tutorial on Medium and tried it out. Again, 401 Unauthorized. And then...
Finally! Finally! Eureka! I had validations on users signing up trough my webpage. When I tried to sign up through google, these validation would fail. Once I removed the validations, everything worked perfect! It is actually beautiful to see it work. No joke, I spent at least 16 hours trying to figure out OmniAuth with devise. But now, I feel comfortable to set it up in my applications!


Helpful Media:
url: 
https://saschakala.medium.com/start-to-finish-devise-with-github-omniauth-authentication-ruby-on-rails-d77b06c995f9

url: 
https://www.youtube.com/watch?v=CnZnwV38cjo

url:
https://medium.com/@paulcmorah/mastering-user-authentication-in-rails-7-with-devise-and-omniauth-06b875a14230


