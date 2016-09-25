module SiteConfigHelpers
    def sitemap_resources
      sitemap.resources
    end

    def site_config
      config[:site_config]
    end

    def site_author
      site_config[:author]
    end

    def site_baseurl
      site_config[:baseurl]
    end

    def site_description
      site_config[:description]
    end

    def site_image_url
      site_config[:image_url]
    end

    def site_title
      site_config[:title]
    end
end
