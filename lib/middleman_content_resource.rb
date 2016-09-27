class MiddlemanContentResource < ItemResource
  attr_reader :middleman_resource, :source_file
  def initialize(resource)
    super(resource)
    @middleman_resource = resource
    @source_file = resource.source_file
    @stub = resource.data.stub
  end

  def content_size
    File.size(@source_file)
  end

  def stub?
    @stub == true # explicitly set
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
