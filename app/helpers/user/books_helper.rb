module User::BooksHelper

  def progress_alt(percentage)
    if percentage > 0.89
      alternative = 'success'
    elsif percentage > 0.49 && percentage < 0.9
      alternative = 'primary'
    elsif percentage < 0.39
      alternative = 'danger'
    else
      alternative = 'warning'
    end
  end

  def active_class(type, param)
    if param.nil? && type == "created_at"
      active = 'active'
    elsif type == param
      active = 'active'
    else
      active = ''
    end
  end

  def sum_pages(status, type)
    if status.nil?
      pages = current_user.books.sum(:pages)
    else
      books = current_user.books.where(status: status)
      pages = books.sum(:pages_read) if type == 'read'
      pages = books.sum(:pages) if type == 'all'
    end

    pages
  end

  def percent(sum)
    total = current_user.books.sum(:pages)

    sum/total.to_f
  end

  def image_for_book(book)
    if book.image.attached?
      book.image
    else
      "missing.jpg"
    end
  end
end
