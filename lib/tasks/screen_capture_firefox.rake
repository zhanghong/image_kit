# rake screen_capture_firefox --trace name=index RAILS_ENV=production
# https://evaryont.me/blog/2014/10/generating-a-screenshot-in-ruby.html
task :screen_capture_firefox => :environment do
  if ["index", "series"].include?(ENV["name"])
    page_name = ENV["name"]
  else
    puts "params is invalid"
    return
  end

  # host = "http://localhost:3000"
  # browser.goto "http://localhost:3000/products.html"
  # file_path = "public/kits/firefox_#{Time.now.to_i}.jpg"
  # browser.driver.save_screenshot(File.join(Rails.root, file_path))
  # browser.close

  browser = Watir::Browser.new :firefox
  # browser = Watir::Browser.new :phantomjs
  # browser.driver.manage.window.maximize
  browser.window.resize_to(1400, 1000)

  # dimensions = Selenium::WebDriver::Dimension.new(1400, 2000)
  # browser.driver.manage.window.size = dimensions

  # browser.goto "http://skshu.zhanghong.com/Pages/design/#{page_name}.html"
  # image_dir = "/Users/zhanghong/php_workspace/skshu_site/Pages/html/#{page_name}"
  
  browser.goto "http://localhost:3000/pages/design/#{page_name}.html"
  file_name = "origin.jpg"
  # browser.goto "http://localhost:3000/pages/origin/#{page_name}.html"
  # file_name = "source.jpg"
  
  image_dir = "/Users/zhanghong/workspace/image_kit/public/pages/html/#{page_name}"

  FileUtils.mkdir_p(image_dir)
  file_path = File.join(image_dir, file_name)
  browser.driver.save_screenshot(file_path)

  puts file_path
end
