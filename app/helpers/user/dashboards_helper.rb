module User::DashboardsHelper
  def total_pages
    books = current_user.books.where(status: 1)

    books.sum(:pages)
  end

  def most_read(lists)
    all_books(lists).inject(Hash.new(0)) { |h,v| h[v] += 1; h }
                    .sort_by{|k,v| v}
                    .reverse
                    .first(10)
  end

  private
  def all_books(lists)
    arr = []
    lists.each do |list|
      arr.push(list.books.pluck(:title))
    end

    arr.flatten
  end
end
