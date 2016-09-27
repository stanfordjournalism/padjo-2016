require 'active_support/core_ext/date'

module LessonHelpers
    BEGINNING_DATE = Date.new(2016, 9, 27).at_beginning_of_week
    def date_range_by_week_number(weeknum)
        dx = BEGINNING_DATE + (weeknum - 1) * 7
        return Range.new(dx.at_beginning_of_week, dx.at_end_of_week)
    end


    def assignments_due_on(somedate)
        assignments.select{|r| r.due_date == somedate}
    end

    def assignments
        sitemap_resources.select{|r|
            r.path =~ /^assignments\/.*?index.html/
        }.map{|r| AssignmentResource.new(r)
        }.sort_by{|r|
            puts r.url
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
