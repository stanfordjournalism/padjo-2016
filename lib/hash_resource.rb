require 'addressable/uri'

class HashResource < ContentResource

  attr_reader :published_at, :authors

  def initialize(resource)
    @url  = @path  = resource[:url]
    @purl = Addressable::URI.parse(@url)


    @image_url = resource[:image_url]
    @title  = resource[:title]
    # @ranking = resource.data.ranking || 99999
    # @_listed = resource.data.listed
    # @source_name = nil
    @full_title = @title

    _dt = resource[:published_at] || resource[:date]
    @date = @published_at = Chronic.parse(_dt) if _dt.present?
    @description = String(resource[:description]).strip()
    @authors = Array(resource[:authors])
    @_publisher_name = resource[:publisher]

  end

  def description?
        description.present?
  end

  def valid_url?
    @purl.present?
  end

  def hostname
    @purl.hostname.sub(/^www\./, '') if remote_url?
  end

  def remote_url?
    valid_url? && @purl.absolute?
  end

  def publisher
    @_publisher_name || hostname
  end

  def publisher?
    publisher.present?
  end

end
