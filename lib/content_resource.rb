require 'chronic'


class ContentResource
  attr_reader :title, :description, :date, :url, :path, :source_name,
    :full_title, :image_url, :stub

  def friendly_week_date
    @date.strftime("%B %-d")
  end

  def date_slug
    @date.strftime("%Y-%m-%d") if @date
  end

  def description?
    !(@description.nil? || @description.empty?)
  end

  def nutgraf
    @nutgraf.present? ? @nutgraf : @description
  end

  def stub?
    @stub == true
  end
end

require 'lib/hash_resource'
require 'lib/item_resource'
require 'lib/middleman_content_resource'
require 'lib/schedule_resource'
require 'lib/assignment_resource'
require 'lib/reference_resource'
