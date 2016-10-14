require 'addressable/uri'
class ReferenceResource < HashResource
    attr_reader :published_at, :publisher, :authors
    def initialize(resource)
        @url  = @path  = resource[:url]
        @image_url = resource[:image_url]
        @title  = resource[:title]
        # @ranking = resource.data.ranking || 99999
        # @_listed = resource.data.listed
        # @source_name = nil
        @full_title = @title
        _date = resource[:published_at] || resource[:date]

        @date  = @published_at =  Chronic.parse(_date) if _date
        @publisher = resource[:publisher] # || Addressable::URI.parse(@url).host
        @description = resource[:description]
        @authors = Array(resource[:authors])
    end


    def author_line # whatever
        if authors.length < 1
            ""
        elsif authors.length == 1
            authors[0]
        elsif authors.length == 2
            authors.join(' and ')
        else
            authors[0..-2].join(', ') + ", and #{authors[-1]}"
        end
    end
end
