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
    arr = []
    lists = params[:lists]
    page_id = params[:page_id]
    if lists.present? && page_id.present?
      keys = %w(name mate_type top left width height)
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
      
      yml_path = File.join(Rails.root, "public/pages/#{page_id}.yml")
      File.open(yml_path, 'w') {|f| f.write arr.to_yaml }
      result = {status: "successed", msg: "success"}
    else
      result = {status: "failed", msg: "value is blank"}
    end
    
    render :json => result
  end
end
