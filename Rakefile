require './crawlers/dell_crawler'
require './app'

desc "This task is called by the Heroku scheduler add-on"
task :update_feed do
  puts "Updating price feed..."
  total = DellCrawler.new.total
  value = total.gsub(/\D/, '').to_i
  Price.create(date: Time.now, total: total, value: value)
  puts "Price feed updated."

  puts "Cheking possible discounts..."
  previous_value = Price.order(date: :desc).first.value || 0

  msg = "Descuento en monitor U2515H, #{previous_value}, #{value}"

  Pony.mail(to: 'harq.soft@gmail.com',
            subject: 'Descuento en Monitor U2515H',
            body: msg) if value < previous_value

  puts "Done."
end