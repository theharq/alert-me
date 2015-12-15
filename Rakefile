require './crawlers/dell_crawler'
require './app'

desc "This task is called by the Heroku scheduler add-on"
task :update_feed do
  puts "Updating price feed..."
  total = DellCrawler.new.total
  Price.create(date: Time.now, total: total)
  puts "done."
end