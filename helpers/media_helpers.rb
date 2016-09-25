module MediaHelpers
  # creates an img.imgwrap tag with a link to the image by default
  def image_wrap(image_src, options = {}, &caption_blk)
    buff = ActiveSupport::SafeBuffer.new
    # handle caption stuff
    if block_given?
       raise ArgumentError.new("Can't pass in block and :caption") if options[:caption].present?
       captext = capture(&caption_blk)
    else
       captext = options.delete(:caption)
    end
    if captext.present?
      captext = markdownify(captext) if options.delete(:markdownify) != false
    end

    options.reverse_merge!(:src => image_src, :class => "", :alt => image_src)
    wrap_classes = ['mediawrap', options.delete(:class)].join(" ")


    # TODO: presenter classes, e.g. thumbnail, rounded, though I guess we can just
    #  pass that in via SASS?
    # TODO: Option to limit width to image's actual width?

    # check for source attributes
    if options[:source_name].present? || options[:source_url].present?
      source_url = options.delete(:source_url)
      source_name = options.delete(:source_name)
      options["data-source-name"] = source_name
      options["data-source-url"] = source_url
    end
    # Create image tag
    imgtag = tag(:img, options)

    # link_to.present? ? link_to(imgtag, link_to) : imgtag

    # Add source line
    # TODO: Add a source label with its own span distinct from source_name
    source_line_tag = if source_name && source_url
      content_tag(:div, link_to(source_name, source_url), :class => "source-line")
    elsif source_url
      content_tag(:div, link_to(source_url, source_url), :class => "source-line")
    elsif source_name
      content_tag(:div, source_name, :class => "source-line")
    else
      nil
    end

    txt = content_tag(:div, :class => wrap_classes) do
      buff.safe_concat imgtag
      captag = content_tag(:figcaption, :class => 'caption') do
        cstr = ""
        cstr += captext if captext.present?
        cstr += source_line_tag if source_line_tag.present?
        cstr
      end
      buff.safe_concat(captag)

      buff
    end

    concat txt
  end

  # TODO add captions and stuff, options for height, etc.
  def iframe_wrap(src_url, options = {})
    buff = ActiveSupport::SafeBuffer.new
    height = options.delete(:height) || 600
    txt = content_tag :div, :class => "iframe_wrap" do
      buff.safe_concat %Q{
        <iframe width="100%" height="#{height}"
        src="#{src_url}"
        frameborder="0"
        allowfullscreen webkitallowfullscreen mozallowfullscreen oallowfullscreen msallowfullscreen>
        </iframe>}
      buff
    end
    concat txt
  end

end
