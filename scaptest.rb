require 'screencap'

  f = Screencap::Fetcher.new('http://champion.gg/champion/Kayn/Top')
  screenshot = f.fetch(
    :output => './champsM/kaytop.png',
    :div => '.skill-order.clearfix'
  )
