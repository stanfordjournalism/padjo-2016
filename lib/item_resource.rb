class ItemResource < ContentResource
  def initialize(resource)
    @url    = resource.url
    @path   = resource.path
    @image_url = resource.data.image_url
    @title  = resource.data.title
    @nutgraf = resource.data.nutgraf
    # @ranking = resource.data.ranking || 99999
    # @_listed = resource.data.listed
    # @source_name = nil
    @full_title = @title
    @date   = Chronic.parse(resource.data.date) if resource.data.date
    @description = resource.data.description
  end

end
