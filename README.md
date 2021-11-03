# Scaffold for social media app with Ruby on Rails
![screenshot](img/stay-in.png)




> This repo includes intial code for social media app with basic styling. Its purpose is to be a starting point for Microverse students.

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4

## Live Demo
[Live Demo Link](https://fast-eyrie-06446.herokuapp.com)





## Getting Started

To get a local copy up and running follow these simple example steps.

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```

### Github Actions

To make sure the linters' checks using Github Actions work properly, you should follow the next steps:

1. On your recently forked repo, enable the GitHub Actions in the Actions tab.
2. Create the `feature/branch` and push.
3. Start working on your milestone as usual.
4. Open a PR from the `feature/branch` when your work is done.


### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rspec --format documentation
```

> Tests will be added by Microverse students. There are no tests for initial features in order to make sure that students write all tests from scratch.

### Use APIs


 To get auth token for unregistered users: 
 
 - Send post request to this url
 ```
 http://localhost:3000/api/v1/reg
 ```
 - With body: 
 ```
 {
    "name": "Your name",
    "email": "yourmail@mail.com",
    "password": "yourpassword",
    "password_confirmation": "yourpassword"
}
 ```
To get auth token for registered users: 

- Send post request to this url
 ```
 http://localhost:3000/api/v1/auth
 ```
 - With body: 
 ```
 {
    "email": "yourmail@mail.com",
    "password": "yourpassword"
}

 ```
 To see all posts: 
 
 - Send get request to this url
 ```
 http://localhost:3000/api/v1/posts
 ```

 To see all comments: 
 
 - Send get request to this url
 ```
 http://localhost:3000/api/v1/posts/{:post_id}/comments
 ```
 *Change the post_id

 To create comment for some post:
 
 - Send post request to this url
 ```
 http://localhost:3000/api/v1/posts/{:post_id}/comments
 ```
 *Change the post_id
 - With body: 
 ```
 {
    "content": "Your comment here!"
}
 And header:
 {
     "Authorization": "{token that you received earlier}"
 }
 ```

## Authors

👤 **Oni Olajumuke Priscilla**

- [@githubhandle](https://github.com/prolajumokeoni)
- [@twitterhandle](https://twitter.com/prolajumokeoni)
- [LinkedIn](https://www.linkedin.com/in/olajumoke-priscilla-oni-44a48b162/)



👤 **Aleksandar Ivezic**

- GitHub: [@ShinobiWarior](https://github.com/ShinobiWarior)
- Twitter: [@Aivezic](https://twitter.com/Aivezic)
- LinkedIn: [Aleksandar Ivezic](https://www.linkedin.com/in/aleksandar-ivezic/)


## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Henryhaulka/ror-social-scaffold/issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments
This Project was inspired by Microverse.


