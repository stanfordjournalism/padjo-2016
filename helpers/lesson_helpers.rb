module LessonHelpers
    def assignments
        sitemap_resources.select{|r|
            r.path =~ /^assignments\/.*?index.html/
        }.map{|r| AssignmentResource.new(r) }
    end

    def find_assignment(page)
        AssignmentResource.new sitemap_resources.find{|a| a == page}
    end

    def schedule
        sitemap_resources.select{|r|
            r.path =~ /^schedule\/\d{4}/
        }.map{|r| ScheduleResource.new(r) }
    end
end
