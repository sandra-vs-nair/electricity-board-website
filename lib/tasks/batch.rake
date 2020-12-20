namespace :batch do
  desc "Send mails"
  task send_mails: :environment do
    Customer.all.each do |customer|
      UserMailer.welcome_email(customer).deliver
    end
  end
end
