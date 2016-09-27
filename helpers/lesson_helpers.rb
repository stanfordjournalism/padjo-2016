module LessonHelpers
    def assignments
        sitemap_resources.select{|r|
            r.path =~ /^assignments\/.*?index.html/
        }.map{|r| AssignmentResource.new(r)
        }.sort_by{|r|
            r.due_date}
    end

    def find_assignment(page)
        AssignmentResource.new sitemap_resources.find{|a| a == page}
    end

    def find_schedule_lesson(page)
        rx = sitemap_resources.find{|r| r == page}
        aggy = referencize(rx.data.agenda)
        ScheduleResource.new(rx, aggy)
    end


    def referencize(things)
        Array(things).map{|a| contentresource(a) }
    end

    def schedule
        sitemap_resources.select{|r|
            r.path =~ /^schedule\/\d{4}/
        }.map{|r| ScheduleResource.new(r, referencize(r.data.agenda)) }
    end
end
