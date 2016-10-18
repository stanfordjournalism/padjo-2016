module PageMetaHelpers
  def page_data_get(attr_name)
     current_page.data[attr_name]
  end

  def page_authors
    Array(page_data_get(:authors))
  end

  def page_date
    page_data_get(:date)
  end

  def page_description
    page_data_get(:description)
  end

  def page_nutgraf?
    page_nutgraf.present?
  end

  def page_nutgraf
    page_data_get(:nutgraf) || page_description
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

  def referenceresource(obj) # like the contentresource factoy
    if obj.is_a?Hash
        if obj[:relative_url].present?
            r = find_sitemap_resource_by_relative_url(obj[:relative_url])
            MiddlemanContentResource.new(r)
        else
            HashResource.new(obj)
        end
    elsif obj.is_a?(String)
        # assume it's a relative URL
        MiddlemanContentResource.new find_sitemap_resource_by_relative_url(obj)
    end
  end


  def page_references
    Array(page_data_get(:references)).map{|r| referenceresource(r)}
  end

  def page_references?
    page_references.present?
  end


  def page_sequence?
    page_data_get(:sequence).is_a?(Hash)
  end

  def page_sequence
    page_data_get(:sequence)
  end

  def page_next_in_sequence
    contentresource(page_sequence[:next]) if page_sequence? and page_sequence[:next].present?
  end

  def page_previous_in_sequence
    contentresource(page_sequence[:previous]) if page_sequence? and page_sequence[:previous].present?
  end

  def page_landing_in_sequence
      contentresource(page_sequence[:landing]) if page_sequence? and page_sequence[:landing].present?
  end
end
