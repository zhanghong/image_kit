# rake generation_skshu_preaches --trace TRUN=ture RAILS_ENV=production
task :generation_skshu_preaches => :environment do
  file_path = "/Users/henry/Desktop/skshu_preaches.xls"
  File.open("/Users/henry/Desktop/skshu_preaches.txt", "w") do |file|
    book = Spreadsheet.open(file_path)
    sheet1 = book.worksheet(0)
    sheet1.each_with_index do |row, idx|
      next if idx == 0
      province, city, name, address = row
      line = [province.to_s, city.to_s, name.to_s, address.to_s]
      line = line.join(",")
      file.puts line
      puts line
    end
  end
end
