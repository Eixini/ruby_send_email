require "pony"
require "io/console"

puts "Enter your email:"
my_mail = STDIN.gets.chomp


puts "Enter your email password to send email:"
password = STDIN.noecho(&:gets).chomp

puts "Enter mail provider (gmail, yandex, mail, rambler ...):"
email_provider = STDIN.gets.chomp

puts "Email recipient:"
send_to = STDIN.gets.chomp

puts "Letter subject:"
subject = STDIN.gets.chomp

puts "What to write in a letter:"
body = STDIN.gets.chomp

Pony.mail(
{
    :subject => subject,
    :body => body,
    :to => send_to,
    :from => my_mail,

    :via => :smtp,
    :via_options => {
        :address => "smtp.#{email_provider}.com",
        :port => '465',
        :tls => true,
        :user_name => my_mail,
        :password => password,
        :authentication => :plain
    }
})

puts "Email sent successfully!"