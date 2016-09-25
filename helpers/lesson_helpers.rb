module LessonHelpers
    def curriculums
        sitemap_resources.select{|r|
            r.path =~ /^curriculums\/[^\/]+?\/index/
        }.map{|r|
            rpath = Pathname.new(r.path).dirname
            lessons =  sitemap_resources.select{|x| x.path !~ /\/common\// && x.path =~ /#{rpath}\/.+?index/ }
            Curriculum.new(r, lessons)
        }
    end
end
