# Web platform for electricity board.

This project aims to create a web platform for Electricity board which focus mainly on the bill management system. The website will have provisions for the registration and login of staffs and customers. Staffs will have the authority to add or modify customer bills. Customers will have the provision to view their own bills. It also includes a system in which the pending bill information is sent to the customer on the first day of every month via email.

## Configuration details

ruby 2.7.2  
postgres (PostgreSQL) 11.10  
Ubuntu 20.04.1 LTS  

## Steps required

### Configuration steps:
1.git clone https://github.com/sandra-vs-nair/electricity-board-website.git electricity\_board/
2.cd electricity\_board
3.rails db:create

### Bcrypt installation:
1.gem install bcrypt
2.bundle install
3.Kill rails server (If running)
4.Kill spring process (ps aux | grep spring) (If running)
5.Uncomment the line starting with "bcrypt" in Gemfile
6.Restart server

### Steps for creating model:
1.rails generate model Customer customer\_name:string password\_digest:string email\_id:string address:string
2.rails db:migrate
3.rails generate model Staff staff\_name:string password\_digest:string email\_id:string address:string
4.rails db:migrate
