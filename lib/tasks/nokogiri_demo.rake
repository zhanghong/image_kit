# rake nokogiri_demo --trace TRUN=ture name=index RAILS_ENV=production
# require 'open-uri'
require 'uri'
require 'net/http'
require 'net/https'
require 'baidu_ocr'
task :nokogiri_demo => :environment do

  img_path = "/Users/zhanghong/php_workspace/skshu_site/Public/kits/10.jpg"
  BaiduOcr.init_baidu_ocr(apikey: "66a70da7aeb00b24e2a3e73eb6ecf1e1",
                        image: img_path,
                        imagetype: 1)
  puts BaiduOcr.recognize

  # # doc = Nokogiri::HTML(open("http://localhost:3000/pages/design/series.html"))
  # # puts doc.css("[data-cid='m1']")
  # # item = doc.css("img[data-cid='m1']")[0]
  # # item["src"] = "image/1.jpg"
  # # puts doc.to_html

  # # $url = 'http://apis.baidu.com/apistore/idlocr/ocr';
  # # $header = array(
  # #     'Content-Type:application/x-www-form-urlencoded',
  # #     'apikey: 66a70da7aeb00b24e2a3e73eb6ecf1e1',
  # # );
  # # $img_path = "/Users/zhanghong/php_workspace/skshu_site/Public/kits/10.jpg";
  # # $data_temp = file_get_contents($img_path);
  # # $data_temp = urlencode(base64_encode($data_temp));
  # # $data = "fromdevice=pc&clientip=10.10.10.0&detecttype=LocateRecognize&languagetype=CHN_ENG&imagetype=1&image=".$data_temp;

  # # @toSend = {
  # #   "date" => "2012-07-02",
  # #   "aaaa" => "bbbbb",
  # #   "cccc" => "dddd"
  # # }.to_json

  # header = {
  #   "Content-Type" => "application/x-www-form-urlencoded",
  #   "apikey" => "66a70da7aeb00b24e2a3e73eb6ecf1e1"
  # }
  # img_path = "/Users/zhanghong/php_workspace/skshu_site/Public/kits/10.jpg"
  # image_data = File.read(img_path)
  # image_data = CGI::escape(image_data)

  # puts image_data
  # # image_data = "/9j/4AAQSkZJRgABAQEAYABgAAD/2wBDABMNDxEPDBMREBEWFRMXHTAfHRsbHTsqLSMwRj5KSUU+RENNV29eTVJpU0NEYYRiaXN3fX59S12Jkoh5kW96fXj/2wBDARUWFh0ZHTkfHzl4UERQeHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHh4eHj/wAARCAAfACEDAREAAhEBAxEB/8QAGAABAQEBAQAAAAAAAAAAAAAAAAQDBQb/xAAjEAACAgICAgEFAAAAAAAAAAABAgADBBESIRMxBSIyQXGB/8QAFAEBAAAAAAAAAAAAAAAAAAAAAP/EABQRAQAAAAAAAAAAAAAAAAAAAAD/2gAMAwEAAhEDEQA/APawEBAQEBAgy8i8ZTVV3UY6V1eU2XoWDDZB19S646Gz39w9fkKsW1r8Wm2yo1PYis1be0JG9H9QNYCAgc35Cl3yuVuJZl0cB41rZQa32dt2y6OuOiOxo61vsLcVblxaVyXD3hFFjL6La7I/sDWAgICAgICB/9k="
  # # file = File.open(img_path)
  # # contents = ""
  # # file.each {|line|
  # #   image_data << line
  # # }
  # # file = File.open(img_path, "rb")
  # # contents = file.read
  # # puts contents

  # # data = {}
  # # data['fromdevice'] = "pc"
  # # data['clientip'] = "10.10.10.0"
  # # data['detecttype'] = "LocateRecognize"
  # # data['languagetype'] = "CHN_ENG"
  # # data['imagetype'] = "1"
  # # # data['image'] = CGI::escape(image_data)

  # # url = URI.parse("http://apis.baidu.com/apistore/idlocr/ocr")
  # # req = Net::HTTP::Post.new(url.path)
  # # req.add_field("Content-Type", "application/x-www-form-urlencoded")
  # # req.add_field("apikey", "66a70da7aeb00b24e2a3e73eb6ecf1e1")

  # # # req.set_form_data(data)


  # # res = Net::HTTP.new(url.host, url.port).start do |http|
  # #   http.request(req, data)
  # # end
  # # puts res.body

  # data = "fromdevice=pc&clientip=10.10.10.0&detecttype=LocateRecognize&languagetype=CHN_ENG&imagetype=1&image="+image_data;
  # uri = URI.parse("http://apis.baidu.com/apistore/idlocr/ocr")
  # http = Net::HTTP.new(uri.host, uri.port)
  # response = http.post(uri.path, data, header)
  # puts response.body

#   uri = URI('http://www.example.com/todo.cgi')
# req = Net::HTTP::Post.new(uri.path)
# req.set_form_data('from' => '2005-01-01', 'to' => '2005-03-31')

# res = Net::HTTP.start(uri.hostname, uri.port) do |http|
#   http.request(req)
# end

  # uri = URI.parse("http://apis.baidu.com/apistore/idlocr/ocr")
  # https = Net::HTTP.new(uri.host,uri.port)
  # req = Net::HTTP::Post.new(uri.path, initheader = header)
  # req['foo'] = 'bar'
  # req.body = "[ #{@toSend} ]"
  # res = https.request(req)
  # puts "Response #{res.code} #{res.message}: #{res.body}"
end
