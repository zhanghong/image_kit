# require 'phantomjs'
class ProductsController < ApplicationController
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
end
