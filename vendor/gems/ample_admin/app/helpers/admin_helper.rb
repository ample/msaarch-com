module AdminHelper

  def title(title)
    content_for(:title) { h(title) }
    return title
  end  

end