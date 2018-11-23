module User::DashboardsHelper
  def total_pages
    books = current_user.books.where(status: 1)

    books.sum(:pages)
  end
end
