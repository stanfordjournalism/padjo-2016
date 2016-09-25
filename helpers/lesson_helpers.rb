module LessonHelpers
    def schedule
        sitemap_resources.select{|r|
            r.path =~ /^schedule\/\d{4}/
        }.map{|r| contentresource(r) }
    end
end
