
desc "Just push it, via middleman s3_sync push"
task :shoop do |t, args|
  puts "Pushing it real good..."
  IO.popen("bundle exec middleman build && bundle exec middleman s3_sync").each do |line|
    p line.chomp
  end
end

