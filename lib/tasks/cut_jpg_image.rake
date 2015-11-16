# rake cut_jpg_image --trace TRUN=ture RAILS_ENV=production
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

  origin_file = File.join(Rails.root, "public/cuts/origin.png")
  lists = YAML::load_file(File.join(Rails.root, "public/pages/product_index.yml"))
  lists.each do |item|
    target_file = File.join(Rails.root, "public/cuts/#{item['name']}.jpg")
    FileUtils.copy_file(origin_file, target_file)
    img = MiniMagick::Image.new(target_file)
    # crop_params = "#{item["width"]}x#{item.height}+#{item["top"]}+#{item["left"]}"
    crop_params = "#{item["width"]}x#{item["height"]}+#{item["left"]}+#{item["top"]}"
    # puts crop_params
    img.crop(crop_params)
  end
end
