# rake cut_jpg_image --trace name=index RAILS_ENV=production
# http://www.cnblogs.com/brooks-dotnet/archive/2010/10/05/1844203.html
task :cut_jpg_image => :environment do
  # origin_file = File.join(Rails.root, "public/cuts/origin.png")
  # target_file = File.join(Rails.root, "public/cuts/a1.png")
  # FileUtils.copy_file(origin_file, target_file)
  # img = MiniMagick::Image.new(target_file)
  # puts img["width"]
  # puts img["height"]

  # # crop_params = "#{params[:w]}x#{params[:h]}+#{params[:x]}+#{params[:y]}"
  # crop_params = "1307x460+0+134"
  # img.crop(crop_params)
  # # target_file = File.join(Rails.root, "public/cuts/a1.png")
  # # img.write(target_file)

  if ["index", "series"].include?(ENV["name"])
    page_name = ENV["name"]

    doc = Nokogiri::HTML(open("http://localhost:3000/pages/design/#{page_name}.html"))

    #image_dir = "/Users/zhanghong/php_workspace/skshu_site/Pages/html/#{page_name}"
    
    image_dir = "/Users/zhanghong/workspace/image_kit/public/pages/html/#{page_name}"
    origin_image = File.join(image_dir, "source.jpg")
    config_file = File.join(image_dir, "config.yml")

    url = "http://localhost:3000/pages/design/#{page_name}.html"
    page = Nokogiri::HTML(url)

    if File.exists?(origin_image) == false
      puts "origin image not present"
    elsif File.exists?(config_file) == false
      puts "config file not present"
    else
      lists = YAML::load_file(config_file)
      image_root_dir = File.join(image_dir, "images")
      FileUtils.mkdir_p(image_root_dir)

      lists.each_with_index do |item, idx|
        next if item['id'].blank?

        target_file = File.join(Rails.root, "public/cuts/#{item['name']}.jpg")
        image_name = "#{Time.now.to_i}_#{idx}.jpg"
        item_path = "images/#{image_name}"
        item_image = File.join(image_root_dir, image_name)

        FileUtils.copy_file(origin_image, item_image)
        img = MiniMagick::Image.new(item_image)
        # crop_params = "#{item["width"]}x#{item.height}+#{item["top"]}+#{item["left"]}"
        crop_params = "#{item["width"]}x#{item["height"]}+#{item["left"]}+#{item["top"]}"
        # puts crop_params
        img.crop(crop_params)

        # puts item_path
        html_item = doc.css("[data-cid='#{item['id']}']")[0]
        if html_item.present?
          case item["mate_type"]
          when "image"
            if item["attr_name"] == "background"
              html_item["style"] = "background-image:url(#{page_name}/#{item_path})"
            else
              html_item["src"] = "#{page_name}/#{item_path}"
            end
          else
            BaiduOcr.init_baidu_ocr(apikey: "66a70da7aeb00b24e2a3e73eb6ecf1e1",
                                  image: item_image,
                                  imagetype: 1)
            image_text = BaiduOcr.recognize rescue image_text = "读取失败"
            html_item.content = image_text
          end
        end
      end

      doc_html = doc.to_html
      File.open(File.join("/Users/zhanghong/workspace/image_kit/public/pages/html/", "#{page_name}.html"), "w") do |file|
        file.puts doc_html
      end
    end
  else
    puts "params is invalid"
  end
end
