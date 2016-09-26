class HashResource < ContentResource
  def initialize(resource)
    @url  = @path  = resource[:url]
    @image_url = resource[:image_url]
    @title  = resource[:title]
    # @ranking = resource.data.ranking || 99999
    # @_listed = resource.data.listed
    # @source_name = nil
    @full_title = @title
    @date   = Chronic.parse(resource[:date]) if resource[:date]
    @description = resource[:description]
  end

end
