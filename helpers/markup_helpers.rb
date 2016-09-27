module MarkupHelpers
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
end
