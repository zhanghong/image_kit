# rake screencap_capture --trace name=index RAILS_ENV=production
task :screencap_capture => :environment do
  page_name = ENV["name"]
  case page_name
  when "index"
    height = 1184
  when "series"
    height = 3100
  else
    height = 1000
  end

  page_url = "http://localhost:3000/pages/design/#{page_name}.html"
  image_dir = "/Users/zhanghong/workspace/image_kit/public/pages/html/#{page_name}"
  FileUtils.mkdir_p(image_dir)
  page_image_path = File.join(image_dir, "origin.jpg")

  fetcher_object = Screencap::Fetcher.new(page_url)
  screenshot = fetcher_object.fetch(
    output: page_image_path,
    # optional parameters:
    # debug: true,
    quality: '100',
    top: 0, left: 0, width: 1400, height: height # Area to capture screenshot of
  )

  puts "page url: #{page_url}"
  puts "image path: #{page_image_path}"
end