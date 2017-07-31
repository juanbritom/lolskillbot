# require 'screencap'
#
#   f = Screencap::Fetcher.new('https://br.op.gg/summoner/userName=Zuk')
#   screenshot = f.fetch(
#     :output => './hehe.png',
#     :div => '.TierBox.Box'
#   )

require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist

Capybara.register_driver :poltergeist do |app|
  Capybara::poltergeist::Driver.new(app, :js_errors => false)
end

page = Capybara::Session.new(:poltergeist)

page.visit('http://champion.gg/champion/Twitch/ADC')
session.save_screenshot('./heeh1.png', :selector => '.skill-order.clearfix')
