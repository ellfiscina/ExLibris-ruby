module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end
  def sortable2(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column2 && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def count_shelf(params)
    total = current_user.books_count
    count = Books::CountQuery.call(current_user, params)
    count/total.to_f
  end
end
