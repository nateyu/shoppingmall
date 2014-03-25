module ApplicationHelper
  def breadcrumb root, path
    content_for :breadcrumb, "<label>#{root} &gt; </label><span>#{path}</span>".html_safe
  end
end
