require 'lib/content_resource'
require 'lib/middleman_content_resource'


def contentresource(obj)
    if obj.is_a?(Middleman::Sitemap::Resource)
        return MiddlemanContentResource.new(obj)

    elsif obj =~ /^https?/ # assume just a URL string
        return {title: obj, url: obj}
    # else
    #     return ContentResource(obj)
    end
end


def find_sitemap_resource_by_relative_url(rel_url)
    rel_url += '/' unless rel_url[-1] == '/'
    r = sitemap_resources.find{|p| p.url == rel_url }
end

