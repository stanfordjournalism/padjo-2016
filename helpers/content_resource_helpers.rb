require 'lib/content_resource'
require 'lib/middleman_content_resource'


def contentresource(obj)
    if obj.is_a?ContentResource
        return obj
    elsif obj.is_a?Hash
        if obj.relative_url.present?
            r = find_sitemap_resource_by_relative_url(obj.relative_url)
            MiddlemanContentResource.new(r)
        else
            HashResource.new(obj)
        end
    elsif obj.is_a?(Middleman::Sitemap::Resource)
        return MiddlemanContentResource.new(obj)

    # elsif obj =~ /^https?/ # assume just a URL string
    #     return {title: obj, url: obj}
    end
end


def find_sitemap_resource_by_relative_url(rel_url)
    rel_url += '/' unless rel_url[-1] == '/'
    r = sitemap_resources.find{|p| p.url == rel_url }
end

