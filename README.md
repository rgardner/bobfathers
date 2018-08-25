# Bobfathers - NYU CAS Cohort 15 (archived)

This project is archived and is no longer under active development.

During my sophomore year at NYU, I was the President of NYU College of Arts and
Science (CAS) Cohort 15, known as the Bobfathers*. The Cohort program was
designed to connect students with their classmates and help students with their
transition to college. Originally, this website was a platform for my fellow
cohort members to suggest interesting ideas for events around NYC. Now, this is
just a static website with the sunset message.

*Bobfathers is a reference to the school mascot, the Bobcat, [which is named
after the NYU's Bobst
Catalog](https://gonyuathletics.com/sports/2008/8/21/FAQ.aspx?id=1039). The
fact that the President of the Bobfathers was in fact named Bob (me!), was
just a happy coincidence.


## Features

- built with Ruby on Rails using safe and modern practices.
- no user account creation required (reduce barrier to entry)
  + users submit ideas through a form on the home page
  + it then emails the user to ensure that they actually want to suggest this
    idea. This ensures that no one suggests an idea on another's behalf.
- ability to sort ideas based on `New` and `Hot` (`created_at`, `updated_at`)
