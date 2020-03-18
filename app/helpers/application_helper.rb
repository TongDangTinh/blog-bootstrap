module ApplicationHelper
  def full_title page_title = ""
    base_title = "My blog"
    page_title.empty? ? base_title : page_title + " | " + base_title
  end

  # Kaminari
  def paginate objects, options = {}
    options.reverse_merge!( theme: 'twitter-bootstrap')
    super( objects, options )
  end
end
