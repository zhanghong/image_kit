# require 'phantomjs'
class ProductsController < ApplicationController
  skip_before_filter :verify_authenticity_token
  # layout :products

  def index
    # path = 'app/assets/javascripts/technews.js'
    # Phantomjs.run(path){|line| puts line }
  end

  def series
    # @kit = IMGKit.new(render_to_string, :width => 1440, "crop-w" => 1440, :encoding => 'utf8')

    # # format.jpg do
    #   send_data(@kit.to_jpg, :type => "image/jpeg", :disposition => 'inline')
    # # end
    # # respond_to do |format|
    # # send_data(@kit.to_img(format.to_sym),
    # #           :type => "image/#{format}", :disposition => 'inline')
    # # end


    # path = 'app/assets/javascripts/technews.js'
    # Phantomjs.run(path){|line| puts line }
    # respond_to do |format|
    #   format.html 
    #   # format.any { render :text => Phantomjs.run(path) }

    # end
  end

  def save_yml
    # YAML::ENGINE.yamler = 'psych'
    # puts "+++++++++ " * 8
    # puts request.user_agent
    # puts "+++++++++ " * 8
    if request.user_agent && request.user_agent.include?("PhantomJS")
      arr = []
      lists = params[:lists]
      page_name = params["name"]

      if lists.blank?
        result = {status: "failed", msg: "lists is blank"}
      elsif page_name.blank?
        result = {status: "failed", msg: "page name is blank"}
      else
        keys = %w(mate_type top left width height attr_name)
        lists.each do |key, list_item|
          val = {}
          list_item.each do |k, v|
            val[k] =  case k
                      when "top", "left"
                        v.to_f.floor
                      when "width", "height"
                        v.to_f.ceil
                      else
                        v
                      end
          end
          arr << val.to_hash
        end
        
        time_str = Time.now.to_i.to_s
        # html_dir = FileUtils.mkdir_p("/Users/zhanghong/php_workspace/skshu_site/Pages/html/#{page_name}")
        html_dir = FileUtils.mkdir_p("/Users/zhanghong/workspace/image_kit/public/pages/html/#{page_name}")
        yml_path = File.join(html_dir, "config.yml")
        File.open(yml_path, 'w') {|f| f.write arr.to_yaml}
        result = {status: "successed", msg: "success"}
      end
    else
      result = {status: "failed", msg: "is not found"}
    end
    
    render :json => result
  end
end
