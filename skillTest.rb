require 'discordrb'
require 'rubygems'
require 'nokogiri'
require 'restclient'
require 'capybara/poltergeist'
require 'fastimage'


bot = Discordrb::Commands::CommandBot.new token: 'MzM4MTU4NTU3MzQ0MDM4OTIz.DFT9AQ.J4HNhIFYL1lwibtspDoYh_Hsg3U', client_id: 338158557344038923, prefix: '!'
Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, :js_errors => false)
end
page = Capybara::Session.new(:poltergeist)

champList = ["Ahri", "Akali", "Alistar", "Amumu", "Anivia", "Annie", "Ashe", "Blitzcrank", "Brand", "Caitlyn", "Cassiopeia", "Cho'Gath", "Corki", "Dr Mundo", "Evelynn", "Ezreal", "Fiddlesticks", "Fiora", "Fizz",
  "Galio","Gangplank", "Garen", "Gragas", "Graves", "Hecarim", "Heimerdinger", "Irelia", "Janna", "Jarvan IV", "Jax", "Karma", "Karthus", "Kassadin", "Katarina", "Kayle", "Kennen", "Kog'Maw", "LeBlanc", "Lee Sin",
  "Leona", "Lulu", "Lux", "Malphite", "Malzahar", "Maokai", "Master Yi", "Miss Fortune", "Mordekaiser", "Morgana", "Nasus", "Nautilus", "Nidalee", "Nocturne", "Nunu", "Olaf", "Orianna", "Pantheon", "Poppy",
  "Rammus", "Renekton", "Riven", "Rumble", "Ryze", "Sejuani", "Shaco", "Shen", "Shyvana", "Singed", "Sion", "Sivir", "Skarner", "Sona", "Soraka", "Swain", "Talon", "Taric", "Teemo", "Tristana",
  "Trundle", "Trydamere", "Twisted Fate", "Twitch", "Udyr", "Urgot", "Varus", "Vayne", "Veigar", "Viktor", "Vladimir", "Volibear", "Warwick", "Wukong", "Xerath", "Xin Zhao", "Yorick", "Ziggs","Zilean","Zyra",
  "Zed","Vi","Syndra","Rengar","Nami","Kha'Zix","Jayce","Elise","Draven","Darius","Diana","Aatrox","Jinx","Lissandra","Lucian","Quinn","Thresh","Yasuo","Zac","Azir","Braum","Gnar","Kalista","Rek'Sai","Vel'Koz",
  "Bardo","Ekko","Illaoi","Kindred","Tahm Kench","Aurelion Sol","Camille","Ivern","Jhin","Kled","Taliyah","Xayah","Rakan","Kayn"]
habList = ["P","Q","W","E","R"]
roleList = ["ADC","Jungle","Middle","Support","Top"]
tiltList = ["https://clips.twitch.tv/TrustworthyGlamorousWhaleDoubleRainbow",
   "https://clips.twitch.tv/FragileTransparentMeatloafUncleNox",
   "https://clips.twitch.tv/SwissAltruisticTortoiseSuperVinlin",
   "https://clips.twitch.tv/SpotlessSpeedyPassionfruitBCouch"]



#this is a very important part of the code, please stay away
bot.command :HI do |event|
  event.respond "HIIIIIIIIIIIIIIIIIIIIIUIIIIIIIIIIIIIIHUHIIIIIIIIIIIIIIIII #{event.user.name}!"
end

#this is a test command, dont use it o.o
bot.command :fkU do |event|
    event.respond "fk u #{event.user.name}!"
end

bot.command :vlw do |event|
  event.respond "enois \n https://clips.twitch.tv/WiseVainDoge4Head"
end

bot.command :hehe do |event|
    event.respond "xd"
end

bot.command :rouli do |event|
  event.respond "gais"
end

bot.command :lago do |event|
  event.respond "AQUI LAGO AÍ?"
end

bot.command :jungle do |event|
  event.respond "mula"
end

bot.command :violence do |event|
  event.respond "SPEED AND MOMENTUM"
end

bot.command :robo do |event|
  event.respond "ROBOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO TIM XINHAAAAAAAAAAAAAAAAAAAAA"
end

bot.command :'18555' do |event|
  event.respond "D E Z O I T O M I L Q U I N H E N T O S E C I N Q U E N T A E C I N C O"
end

bot.command :salve do |event|
  event.respond "çauve"
end

bot.command :tilt do |event|
    event.respond "T I O  T Á  N Ã O \n #{tiltList.sample}"
end

bot.command :credits do |event|
  event.respond "Made by Juan 'Zuk' Brito and Bruno 'PRL' Gabriel, using Discordrb, nokogiri, screencapture => <https://github.com/juanbritom/lolskillbot> \n
  Infos about champion\'s skills from League of Legends wikia => <http://leagueoflegends.wikia.com/wiki/League_of_Legends_Wiki>\n
  Infos about most recent mastery pages, runes and skill order from champion.gg => <http://champion.gg>\n
  Tilt clips from our beloved tilt master (yi) cowsep => <http://twitch.tv/cowsep>"
end

bot.command(:invite, chain_usable: false) do |event|
  # This simply sends the bot's invite URL, without any specific permissions,
  # to the channel.
  event.bot.invite_url
end

bot.command :haha do |event|
  event.respond "HAHAHAHAHAHAHAHAHAHAHAHAHAHAHAHA\nhttps://www.youtube.com/watch?v=0vhfEgQVDAc"
end

#tentativa usando site da rito gomes
# bot.command :skill do |event, *args|
#   if args.length.eql? 2 then
#     champ = args[0]
#     hab = args[1]
#   elsif args.length.eql? 3 then
#     champ = "#{args[0]} #{args[1]}"
#     hab = args[2]
#   end
#   if champList.include? champ and habList.include? hab then
#     if champ.include? "'"
#       champ = champ.tr('\'','')
#     elsif champ.include? " " then
#       champ = champ.tr(' ','')
#     end
#     champD = champ.downcase
#     champ = champD.capitalize
#     page = "http://gameinfo.br.leagueoflegends.com/pt/game-info/champions/#{champD}/"
#     champPage = Nokogiri::HTML(RestClient.get(page))
#     case hab
#     when "P"
#       response = champPage.css('div#spell-passive')[0].text
#     when "Q"
#       response = champPage.css("div#spell-#{champ}Q")[0].text
#     when "W"
#       response = champPage.css("div#spell-#{champ}W")[0].text
#     when "E"
#       response = champPage.css("div#spell-#{champ}E")[0].text
#     when "R"
#       response = champPage.css("div#spell-#{champ}R")[0].text
#     end
#     if champ.include? "Yasuo" then
#       event.respond "http://www.apaecuritiba.org.br"
#     end
#     event.respond response
#   else
#     even.respond "Habilidade ou champion inválido hehe xD"
#   end
# end

#tentativa usando site da leagueoflegends wikia (gods)

#comando sem mostrar imagem
bot.command :skillN do |event, *args|
  if args.length.eql? 2 then
    champ = args[0]
    hab = args[1]
  elsif args.length.eql? 3 then
    champ = "#{args[0]} #{args[1]}"
    hab = args[2]
  end
  if champList.include? champ and habList.include? hab then
    if champ.include? ' ' then
      champ.sub!(' ','_')
    end
    page = "http://leagueoflegends.wikia.com/wiki/#{champ}/Abilities"
    champPage = Nokogiri::HTML(RestClient.get(page))
    case hab
    when "P"
      response = "#{champPage.css('div.skill')[0].text}"
      response = response.gsub /^$\n/, ''
    when "Q"
      response = champPage.css("div.skill.skill_q")[0].text
      response = response.gsub /^$\n/, ''
    when "W"
      response = champPage.css("div.skill.skill_w")[0].text
      response = response.gsub /^$\n/, ''
    when "E"
      response = champPage.css("div.skill.skill_e")[0].text
      response = response.gsub /^$\n/, ''
    when "R"
      response = champPage.css("div.skill.skill_r")[0].text
      response = response.gsub /^$\n/, ''
    end
    if champ.include? "Yasuo" then
      event.respond "http://www.apaecuritiba.org.br"
    end
    event.respond response
  else
    event.respond "Habilidade ou champion inválido hehe xD"
  end
end

#mostrar page dum champion no probuilds (mais rapido que google?)
bot.command :prob do |event, *args|
  if(args.length<2)
    event.respond "http://www.probuilds.net/champions/details/#{args[0]}"
  else
    event.respond "http://www.probuilds.net/champions/details/#{args[0]}\%20#{args[1]}"
  end
end

#comando padrão mostra imagem
bot.command :skill do |event, *args|
  if args.length.eql? 2 then
    champ = args[0]
    hab = args[1]
  elsif args.length.eql? 3 then
    champ = "#{args[0]} #{args[1]}"
    hab = args[2]
  end
  if champList.include? champ and habList.include? hab then
    if champ.include? ' ' then
      champ.sub!(' ','_')
    end
    page = "http://leagueoflegends.wikia.com/wiki/#{champ}/Abilities"
    champPage = Nokogiri::HTML(RestClient.get(page))
    case hab
    when "P"
      response = "#{champPage.css('div.skill')[0].text}"
      response = response.gsub /^$\n/, ''
      skill_title = response.lines.first
      if skill_title.include? ' ' then
        skill_title.gsub!(' ','_')
      end
      if skill_title.include? "\n" then
        skill_title.gsub!("\n",'')
      end
      skill_title.sub!('!',"\%21")
      skill_title.sub!('\'',"\%27")
      i = 0
      img = champPage.css("div.skill img")[i].attr('src')
      while true
        if img.include? skill_title then
          break
        end
        i = i+1
        img = champPage.css("div.skill img")[i].attr('src')
      end
    when "Q"
      response = champPage.css("div.skill.skill_q")[0].text
      response = response.gsub /^$\n/, ''
      skill_title = response.lines.first
      if skill_title.include? ' ' then
        skill_title.gsub!(' ','_')
      end
      if skill_title.include? "\n" then
        skill_title.gsub!("\n",'')
      end
      skill_title.sub!('!',"\%21")
      skill_title.sub!('\'',"\%27")
      i = 0
      img = champPage.css("div.skill.skill_q img")[i].attr('src')
      while true
        if img.include? skill_title then
          break
        end
        i = i+1
        img = champPage.css("div.skill.skill_q img")[i].attr('src')
      end
    when "W"
      response = champPage.css("div.skill.skill_w")[0].text
      response = response.gsub /^$\n/, ''
      skill_title = response.lines.first
      if skill_title.include? ' ' then
        skill_title.gsub!(' ','_')
      end
      if skill_title.include? "\n" then
        skill_title.gsub!("\n",'')
      end
      skill_title.sub!('!',"\%21")
      skill_title.sub!('\'',"\%27")
      i = 0
      img = champPage.css("div.skill.skill_w img")[i].attr('src')
      while true
        if img.include? skill_title then
          break
        end
        i = i+1
        img = champPage.css("div.skill.skill_w img")[i].attr('src')
      end
    when "E"
      response = champPage.css("div.skill.skill_e")[0].text
      response = response.gsub /^$\n/, ''
      skill_title = response.lines.first
      if skill_title.include? ' ' then
        skill_title.gsub!(' ','_')
      end
      if skill_title.include? "\n" then
        skill_title.gsub!("\n",'')
      end
      skill_title.sub!('!',"\%21")
      skill_title.sub!('\'',"\%27")
      i = 0
      img = champPage.css("div.skill.skill_e img")[i].attr('src')
      while true
        if img.include? skill_title then
          break
        end
        i = i+1
        img = champPage.css("div.skill.skill_e img")[i].attr('src')
      end
    when "R"
      response = champPage.css("div.skill.skill_r")[0].text
      response = response.gsub /^$\n/, ''
      skill_title = response.lines.first
      if skill_title.include? ' ' then
        skill_title.gsub!(' ','_')
      end
      if skill_title.include? "\n" then
        skill_title.gsub!("\n",'')
      end
      skill_title.sub!('!',"\%21")
      skill_title.sub!('\'',"\%27")
      i = 0
      img = champPage.css("div.skill.skill_r img")[i].attr('src')
      while true
        if img.include? skill_title then
          break
        end
        i = i+1
        img = champPage.css("div.skill.skill_r img")[i].attr('src')
      end
    end
    if champ.include? "Yasuo" then
      event.respond "<http://www.apaecuritiba.org.br>"
    end
    event.respond img
    event.respond response
  else
    event.respond "Habilidade ou champion inválido hehe xD"
  end
end

bot.command :skillorder do |event, *args|
  if args.length.eql? 2 then
    champ = args[0]
    role = args[1]
  elsif args.length.eql? 3 then
    champ = "#{args[0]} #{args[1]}"
    role = args[2]
  end
  if champList.include? champ and roleList.include? role then
    champ.gsub!(' ','')
    champ.gsub!("\'",'')
    #procura existencia da imagem e se sua data é muito antiga (perde relevancia no meta) (86400 = 1 dia em s)
    if File.exists? "./champsSO/#{champ}at#{role}.jpg" then
      if (Time.now - File.mtime("./champsSO/#{champ}at#{role}.jpg")) > 86400 then
        page.visit("http://champion.gg/champion/#{champ}/#{role}")
        page.save_screenshot("./champsSO/#{champ}at#{role}.jpg", :selector => '.skill-order.clearfix')
        while (FastImage.size("./champsSO/#{champ}at#{role}.jpg")[0] > 500)
          page.save_screenshot("./champsSO/#{champ}at#{role}.jpg", :selector => '.skill-order.clearfix')
        end
      end
    else
      page.visit("http://champion.gg/champion/#{champ}/#{role}")
      page.save_screenshot("./champsSO/#{champ}at#{role}.jpg", :selector => '.skill-order.clearfix')
      while (FastImage.size("./champsSO/#{champ}at#{role}.jpg")[0] > 500)
        page.save_screenshot("./champsSO/#{champ}at#{role}.jpg", :selector => '.skill-order.clearfix')
      end
    end
    event.send_file(File.open("./champsSO/#{champ}at#{role}.jpg", 'r'), caption: "Skill Order for #{role} #{champ}")
  else
    event.respond "Role ou champion inválido hehe xD"
  end
end

bot.command :mastery do |event, *args|
  if args.length.eql? 2 then
    champ = args[0]
    role = args[1]
  elsif args.length.eql? 3 then
    champ = "#{args[0]} #{args[1]}"
    role = args[2]
  end
  if champList.include? champ and roleList.include? role then
    champ.gsub!(' ','')
    champ.gsub!("\'",'')
    #procura existencia da imagem e se sua data é muito antiga (perde relevancia no meta) (86400 = 1 dia em s)
    if File.exists? "./champsMS/#{champ}at#{role}.jpg" then
      if (Time.now - File.mtime("./champsMS/#{champ}at#{role}.jpg")) > 86400 then
        page.visit("http://champion.gg/champion/#{champ}/#{role}")
        page.save_screenshot("./champsMS/#{champ}at#{role}.jpg", :selector => '.mastery-container.clearfix')
        while (FastImage.size("./champsMS/#{champ}at#{role}.jpg")[0] > 650)
          page.save_screenshot("./champsMS/#{champ}at#{role}.jpg", :selector => '.mastery-container.clearfix')
        end
      end
    else
      page.visit("http://champion.gg/champion/#{champ}/#{role}")
      page.save_screenshot("./champsMS/#{champ}at#{role}.jpg", :selector => '.mastery-container.clearfix')
      while (FastImage.size("./champsMS/#{champ}at#{role}.jpg")[0] > 650)
        page.save_screenshot("./champsMS/#{champ}at#{role}.jpg", :selector => '.mastery-container.clearfix')
      end
    end
    event.send_file(File.open("./champsMS/#{champ}at#{role}.jpg", 'r'), caption: "Masteries for #{role} #{champ}")
  else
    event.respond "Role ou champion inválido hehe xD"
  end
end

bot.command :runes do |event, *args|
  if args.length.eql? 2 then
    champ = args[0]
    role = args[1]
  elsif args.length.eql? 3 then
    champ = "#{args[0]} #{args[1]}"
    role = args[2]
  end
  if champList.include? champ and roleList.include? role then
    champ.gsub!(' ','')
    champ.gsub!("\'",'')
    #procura existencia da imagem e se sua data é muito antiga (perde relevancia no meta) (86400 = 1 dia em s)
    if File.exists? "./champsRN/#{champ}at#{role}.jpg" then
      if (Time.now - File.mtime("./champsRN/#{champ}at#{role}.jpg")) > 86400 then
        page.visit("http://champion.gg/champion/#{champ}/#{role}")
        page.save_screenshot("./champsRN/#{champ}at#{role}.jpg", :selector => '.rune-collection')
        while (FastImage.size("./champsRN/#{champ}at#{role}.jpg")[0] > 650)
          page.save_screenshot("./champsRN/#{champ}at#{role}.jpg", :selector => '.rune-collection')
        end
      end
    else
      page.visit("http://champion.gg/champion/#{champ}/#{role}")
      page.save_screenshot("./champsRN/#{champ}at#{role}.jpg", :selector => '.rune-collection')
      while (FastImage.size("./champsRN/#{champ}at#{role}.jpg")[0] > 650)
        page.save_screenshot("./champsRN/#{champ}at#{role}.jpg", :selector => '.rune-collection')
      end
    end
    event.send_file(File.open("./champsRN/#{champ}at#{role}.jpg", 'r'), caption: "Runes for #{role} #{champ}")
  else
    event.respond "Role ou champion inválido hehe xD"
  end
end

bot.run
