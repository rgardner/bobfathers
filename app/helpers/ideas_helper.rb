module IdeasHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    if column == sort_column
      arrow_style = sort_direction == "asc" ? "up" : "down"
      css_class = "icon-arrow-#{arrow_style}"
      direction = sort_direction == "asc" ? "desc" : "asc"
      link_to (title + " " + content_tag(:i, nil, class: css_class)).html_safe,
              sort: column, direction: direction
    else
      link_to title, sort: column
    end
  end
end
