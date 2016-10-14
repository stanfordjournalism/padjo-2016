require 'pathname'

desc "Just push it, via middleman s3_sync push"
task :shoop do |t, args|
  puts "Pushing it real good..."
  IO.popen("bundle exec middleman build && bundle exec middleman s3_sync").each do |line|
    p line.chomp
  end
end



PAGE_FRONTMATTER = """---
title: Title
stub: true
description: |
    lorem ipsum title title title
---
"""


desc "Create index page inside subdirectory"
task :makepage, [:path] do |t, args|
    relative_destpath = args.path
    full_destdir = Pathname.new('./source').join relative_destpath
    full_destpath = full_destdir.join('index.html.md.erb')
    if full_destpath.exist?
        puts "Skipping: #{full_destpath} exists"
    else
        full_destdir.mkpath
        full_destpath.write(PAGE_FRONTMATTER)
        puts("Creating: #{full_destpath}")
    end
end
