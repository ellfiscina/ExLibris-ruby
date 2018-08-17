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
end
