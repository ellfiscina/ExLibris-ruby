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

  def count_books(status=nil)
    books = current_user.books.where(shelf: 1)

    if status.nil?
      books.count
    else
      books.where(status: status).count
    end
  end

  def pages_percent(sum)
    total = current_user.books.where(shelf: 1).sum(:pages)

    sum/total.to_f
  end

  def books_percent(count, total)
    count/total.to_f
  end

  def image_for_book(book)
    if book.image.attached?
      book.image
    else
      "missing.jpg"
    end
  end

  def max_count
    l = []
    current_user.lists.each do |list|
      l.push(list.books.count)
    end
    l.max
  end

  def max_pages
    l = []
    current_user.lists.each do |list|
      l.push(list.books.sum(:pages))
    end
    l.max
  end
end
