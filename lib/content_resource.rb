require 'chronic'


class ContentResource
  attr_reader :title, :description, :date, :url, :path, :source_name,
    :full_title, :image_url
  def friendly_week_date
    @date.strftime("%B %-d")
  end

  def date_slug
    @date.strftime("%Y-%m-%d") if @date
  end

  def description?
    !(@description.nil? || @description.empty?)
  end
end


require 'lib/middleman_content_resource'
require 'lib/curriculum'
