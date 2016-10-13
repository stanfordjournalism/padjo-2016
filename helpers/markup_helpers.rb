module MarkupHelpers
    def slugify(txt)
      Middleman::Util::UriTemplates::safe_parameterize(txt)
    end

    def markdownify(str = nil, &block)
      if str.nil? && !block_given?
        return ""
#        raise StandardError, "Markdownify requires a string or a block"
      elsif str.present? && block_given?
        raise StandardError, "Markdownify requires either string or a block, not both"
      end
      if block_given?
        txt = Kramdown::Document.new(capture_html(&block)).to_html
        concat_content(txt)
      else
        return Kramdown::Document.new(str).to_html
      end
    end


    def link_to_if(condition, name, options = {}, html_options = {}, &block)
      if condition
        link_to(name, options, html_options)
      else
        if block_given?
          block.arity <= 1 ? capture(name, &block) : capture(name, options, html_options, &block)
        else
          ERB::Util.html_escape(name)
        end
      end
    end

    def link_to_unless(condition, name, options = {}, html_options = {}, &block)
      link_to_if !condition, name, options, html_options, &block
    end
end
