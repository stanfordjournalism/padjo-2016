class MiddlemanContentResource < ContentResource
  attr_reader :middleman_resource, :source_file, :ranking
  def initialize(resource)
    @middleman_resource = resource
    @source_file = resource.source_file
    @url    = resource.url
    @path   = resource.path
    @image_url = resource.data.image_url
    @title  = resource.data.title
    # @ranking = resource.data.ranking || 99999
    # @_listed = resource.data.listed
    # @source_name = nil
    @full_title = @title
    @date   = Chronic.parse(resource.data.date) if resource.data.date
    @description = resource.data.description
  end

  def content_size
    File.size(@source_file)
  end

  def stub?
    content_size < 1024
  end


  # def listed?
  #   @_listed == true
  # end

  # def self.set_sitemap(sitemap) #UGGHGHGHGHTK
  #   @sitemap = sitemap
  # end

  # def self.sitemap_resources
  #   @sitemap.resources # theoretically could be scoped to just briefs/tutorials/etc
  # end

  # # rel_url is a String: /articles/my-fav-article
  # #  trailing slash is optional
  # def self.find_sitemap_resource_by_relative_url(rel_url)
  #   rel_url += '/' unless rel_url[-1] == '/'
  #   r = self.sitemap_resources.find{|p| p.url == rel_url }
  # end
end
