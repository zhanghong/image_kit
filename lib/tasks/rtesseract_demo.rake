# rake rtesseract_demo --trace TRUN=ture RAILS_ENV=production
# http://www.fanli7.net/a/bianchengyuyan/C__/20130530/318826.html
task :rtesseract_demo => :environment do
  img_path = File.join(Rails.root, "public/cuts/10.jpg")
  img = RTesseract.new(img_path)
  puts img.to_s
end


# rake screencap_capture --trace name=index
# rake cut_jpg_image --trace name=index

# rake screencap_capture --trace name=series
# rake cut_jpg_image --trace name=series