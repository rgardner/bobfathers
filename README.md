# Bobfathers - NYU CAS Cohort 15
Originally, this website was a platform for my fellow cohort members to suggest
interesting ideas for events around NYC. Now, this is just a static website
with the sunset message.


## Features
- built with Ruby on Rails using safe and modern practices.
- no user account creation required
  + users submit ideas through a form on the home page
  + it then emails the user to ensure that they actually want to suggest this
    idea. This ensures that no one suggests an idea on another's behalf.
- ability to sort ideas based on `New` and `Hot` (`created_at`, `updated_at`)
