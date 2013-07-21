User Flow
* Sign up --> logs you in, goes to /posts
* User goes to /posts/new to submit link, redirected to posts/:id 
* User comments on a post --> all posts needs to have a form that 
associates comments with them
* User looks at their own posts / comments on those pages
* User logs out
* User logs back in

## Sign Up / Log in
* :index view has 2 forms, sign up and log in
* sign up form POST to /user/new --> creates a user, redirects to /posts
* sign in form POST to /session/new --> store user ID in session, redirect to /posts

## Create A Post
* click on "new post" link, GET request to /posts/new
* fill out form, POST to /posts/new
  * getting the user_id from the session to tell the DB the post user_id
* redirect /posts/:id

## Create a Comment
* when looking at GET /posts/:id, see comment form at the bottom or top
* comment form - POST to /comments/new
  * grab the post ID from the URL
  * grab the user ID from the session
* redirect to /posts/:id

## Viewing User Profile
* click on user profile link via GET /posts
  * @user = User.find(session[:user_id])
  * <a href="/users/<%= @user.id %>"
  * gets the user ID from the session
* GET /users/:id
  * links to users/:id/posts and users/:id/comments

## Viewing User Posts
  * click on link on user profile to users/:id/posts
  * lists out links to user posts

## Viewing User Comments
  * click on link on user profile to users/:id/comments
  * lists out links to user comments

## Log Out 
* Implement logout button on home page at first, move to nav bar


# ADDING VOTES 4 EVERRRR

User Flow
* User sees upvote and downvote buttons per post and per comment
* User sees total numbers of votes (up - down) per post and per comment

Where Are We Adding Voting
* Post detail 



### TO DO
* Validate URL in post form has HTTP:// ()

