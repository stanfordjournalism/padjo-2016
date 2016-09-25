module PageMetaHelpers
  def page_data_get(attr_name)
     current_page.data[attr_name]
  end

  def page_authors
    Array(page_data_get(:authors))
  end

  def page_description
    page_data_get(:description)
  end

  def page_image_url
    page_data_get(:image_url)
  end

  def page_title
    page_data_get(:title)
  end

  def page_type
    page_data_get(:page_type) || 'article'
  end

  def page_url
    current_page.url
  end
end
