# Ilium City Public Library Book Loan System

## Introduction

This application serves the Ilium City Public Library by facilitating the loaning process of books to its members.
 Members can reserve books online and specify a pick-up time for their convenience.

### Technical Stack

- **Framework**: Ruby on Rails 7.0.6
- **Language**: Ruby 3.2.2
- **Database**: PostgreSQL
- **CSS Framework**: Bootstrap
- **Deployment**: Heroku

#### Prerequisites

- Ruby 3.2.2
- Rails 7.0.6
- PostgreSQL 13.3

#### Assumptions
Users must be logged in to reserve a book.
Each user can only reserve a book once.

##### Design
The application uses a simple MVC architecture with a PostgreSQL database. The front-end is built with Bootstrap for simplicity.

#### Installation

1. Clone the repository:

```bash
git clone https://github.com:apotema/library_book_loan.git ilium-library-system
cd ilium-library-system
```
2. Install the dependencies:

```bash
bundle install
```

3. Create and migrate your database:
```bash
rails db:create db:migrate db:seed
```
4. Start the Rails server:
```bash
rails server
```

5. Visit in your web browser.
```bash
 http://localhost:3000

 Possible Logins
 foo@bar.com/foobar - role: Clerk
 user@user.com/userpassword - role: Basic User

```

Hosting
The application is hosted on Heroku and can be accessed at https://city-public-library-1714b4a0ae10.herokuapp.com

#### Running the specs

```bash
 bundle exec rspec
```
