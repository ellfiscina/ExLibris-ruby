module ApplicationHelper
  def sortable(column, title = nil)
    title ||= column.titleize
    direction = (column == sort_column && sort_direction == "asc") ? "desc" : "asc"
    link_to title, :sort => column, :direction => direction
  end

  def count_shelf(params)
    total = current_user.books_count
    count = Books::CountQuery.call(current_user, params)
    count/total.to_f
  end

  def author_for_select
    a = []
    Author.all.order(:name).each do |author|
      a.push([author.name, author.id])
    end

    a
  end

  def editor_for_select
    a = []
    Editor.all.order(:name).each do |editor|
      a.push([editor.name, editor.id])
    end

    a
  end
end
