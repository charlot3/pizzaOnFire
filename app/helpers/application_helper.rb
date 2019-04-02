module ApplicationHelper
  def full_title(page_title = '')
    base_title = "PizzaExpress"
    if page_title.empty?
      base_title
    else
      page_title + ' | ' + base_title
    end
  end

  def image_tag(img , options={})
    path = "#{Rails.root}/app/assets/images/#{img}"
    img = "default.jpg"  unless img.present? and File.file?(path)
    super(img, options)
  end

end
