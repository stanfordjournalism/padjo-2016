require 'addressable/uri'
module MetaHelpers

  def meta_authors
    # unlike page_authors, this always returns a string
    Array(page_authors || site_authors).join('; ')
  end


  def meta_description
    (page_description || site_description).strip
  end

  def meta_image_url
    if page_image_url.present?
      a = Addressable::URI.parse(page_image_url)
      url = a.relative? ? Addressable::URI.join(site_baseurl, a) : a
    else
      url = site_image_url
    end
    return url
  end

  def meta_title
    p_title = page_title
    if p_title.present?
      if p_title != site_title
        title ="#{p_title} | #{site_title}"
      else
        title = site_title
      end
    else
      title = site_title
    end
    return title
  end

  def meta_page_type
    page_type || 'website'
  end


  def meta_url
    Addressable::URI.join( site_baseurl, page_url)
  end

end
