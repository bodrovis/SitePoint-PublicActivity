module ApplicationHelper
  def page_header(header)
    content_for(:page_header) {header.to_s}
  end
end
