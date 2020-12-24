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
5.rails generate model Bill year:string month:string amount:float status:string staff\_name:string staff\_email:string customer:references  
6.rails db:migrate  

### Crontab (Normal installation steps. Only step 2 is needed in your PC since I have completed all other steps.):  
1.Include this line in Gem file: gem 'whenever', require: false  
2.Use command "bundle"  
3.Use command "bundle exec wheneverize . " to create schedule.rb  

### Enable email scheduling task with crontab (I have completed step one.):  
1.Add required lines in schedule.rb  
2.Use command "bundle exec whenever --update-crontab --set environment='development'" to update crontab with instructions in schedule.rb  
3.Use command "sudo service cron restart" to restart cron server  
4.Clear crontab task after use with "crontab -r"  
5.Note that the email settings are included in config/environments/development.rb  

### Add task (email scheduling in our case. All the below steps are completed by me.):  
1.rails g task batch send\_mails  
2.Edit lib/tasks/batch.rake  

## Reference links  
1.https://levelup.gitconnected.com/simple-authentication-guide-with-ruby-on-rails-16a6255f0be8  
2.https://www.tutorialspoint.com/ruby-on-rails/rails-send-email.htm  
3.https://guides.rubyonrails.org/v3.2/action\_mailer\_basics.html  
4.https://dev.to/risafj/cron-jobs-in-rails-a-simple-guide-to-actually-using-the-whenever-gem-now-with-tasks-2omi  
5.https://stackoverflow.com/questions/6453618/rails-whenever-gem-each-month-on-the-20th  
