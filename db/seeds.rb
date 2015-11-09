# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# kit = IMGKit.new("http://localhost:3000/products/series.html", :quality => 100, :width => 1440, "crop-w" => 1440, :encoding => 'ascii-8bit')
# # kit.stylesheets << "app/assets/stylesheets/http_style.css"
# file = kit.to_file(File.join(Rails.root, "public/kits/series_4.jpg"))

# url = PostRank::URI.clean("http://www.google.com")
# #filename = current_user.username + "_" + cur_date + '.jpg'
# filename = "quartz4.jpg"

# side_size = 300
# crop_side_size = 300
# kit = IMGKit.new(url, :quality => 100,
#                       :width   => side_size,
#                       :height  => side_size,
#                       "crop-w" => crop_side_size,
#                       "crop-h" => crop_side_size,
#                       "disable-smart-width" => true,
#                       "zoom" => 0.2)

# file = kit.to_file(Rails.root + "public/kits/" + filename)

# browser = Watir::Browser.new :chrome
browser = Watir::Browser.new :firefox
browser.goto "http://localhost:3000/products/series.html"

# screen_width = browser.execute_script("return screen.width;")
# screen_height = browser.execute_script("return screen.height;")
# browser.driver.manage.window.resize_to(screen_width,screen_height)
# browser.driver.manage.window.move_to(0,0)

# browser.maximize()
browser.driver.save_screenshot(File.join(Rails.root, "public/kits/#{Time.now.to_i}.jpg"))
browser.close

# WebDriver driver = new RemoteWebDriver("http://localhost:9515", DesiredCapabilities.chrome());
# driver.get("http://www.google.com");

# require 'screencap'
# f = Screencap::Fetcher.new('http://localhost:3000/products/series')
# screenshot = f.fetch(
#   :quality => 100,
#   :output => File.join(Rails.root, "public/kits/series_6.jpg"), # don't forget the extension!
#   :width => 1400
# )