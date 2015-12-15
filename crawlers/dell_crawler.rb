require 'capybara'
require 'capybara/poltergeist'

Capybara.run_server = false
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, js_errors: false)
end
Capybara.current_driver = :poltergeist
Capybara.app_host = 'http://configure.la.dell.com'
Capybara.default_max_wait_time = 15

class DellCrawler
  include Capybara::DSL

  def initialize
    visit('/dellstore/config.aspx?c=co&cs=codhs1&l=es&oc=LU2515H&s=dhs')
  end

  def total
    execute_script("tabChange(2,'true');")
    execute_script('cart_add(_Action);')
    find('.ec-widthborder :nth-child(2) .ec-subtotaltotal').text
  end
end