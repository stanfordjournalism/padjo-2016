# General configuration
require 'hashie'
require 'pathname'
require 'lib/content_resource'

activate :pry
activate :directory_indexes
activate :sprockets
set :site_config, ::Hashie::Mash.new(YAML.load_file("./site_config.yaml"))


# Reload the browser automatically whenever files change
configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  activate :minify_css
  activate :minify_javascript
end


##
# Page options, layouts, aliases and proxies
###

set :layout, :page_layout
page /schedule\/\d{4}-\d{2}-\d{2}.html/, layout: :schedule_layout
page 'assignments/*', layout: :assignment_layout

# Per-page layout changes:
# With no layout
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false


set :js_dir, 'assets/javascripts'
set :css_dir, 'assets/stylesheets'
set :images_dir, 'assets/images'

###
# Helpers
###

# require 'helpers/lesson_helpers'#
# require 'helpers/media_helpers'
# require 'helpers/meta_helpers'
# require 'helpers/page_meta_helpers'
# require 'helpers/site_config_helpers'

# helpers LessonHelpers
# helpers MediaHelpers
# helpers MetaHelpers
# helpers PageMetaHelpers
# helpers SiteConfigHelpers



# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

activate :s3_sync do |s3_sync|
#  s3_sync.bucket                     = '2015.padjo.org' # The name of the S3 bucket you are targetting. This is globally unique.
  s3_sync.region                     = 'us-east-1'     # The AWS region for your bucket.
  s3_sync.delete                     = false # We delete stray files by default.
#  s3_sync.after_build                = true # We do not chain after the build step by default.
  s3_sync.prefer_gzip                = false
  s3_sync.path_style                 = true
  s3_sync.reduced_redundancy_storage = false
  s3_sync.acl                        = 'public-read'
  s3_sync.encryption                 = false
#  s3_sync.prefix                     = ''
end

