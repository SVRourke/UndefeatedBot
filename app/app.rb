require_relative "./../environment.rb"

app = BotController.new()
alert = Notifier.new
puts app.class

seeds = []

running = true
app.sproutProducts(seeds)

while running

    update = app.check_products
    
    if update
        update.each {|p| alert.notify(p.title)}
        puts "NOTIFIED"
    end

    sleep(20)
    puts "checking again"
end