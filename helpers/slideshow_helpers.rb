module SlideshowHelpers

  def page_slides
    sp = Pathname(current_page.path).parent.join('slides/').to_s
    slides = sitemap.resources.select{|r| r.path.include?(sp) }

    slides
  end

  def page_slide_count
    page_slides.length
  end

end
