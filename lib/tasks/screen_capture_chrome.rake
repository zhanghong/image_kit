# rake screen_capture_firefox --trace TRUN=ture RAILS_ENV=production
task :screen_capture_chrome => :environment do
  browser = Watir::Browser.new :chrome
  host = "http://localhost:3000"
  browser.goto "http://localhost:3000/products/series.html"
  file_path = "public/kits/firefox_#{Time.now.to_i}.jpg"
  browser.driver.save_screenshot(File.join(Rails.root, file_path))
  browser.close
  
  puts ""
end