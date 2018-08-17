module User::AuthorsHelper
  def first_name(name)
    if name.split.count > 1
      name.split[0..-2].join(' ')
    else
      name
    end
  end

  def last_name(name)
    if name.split.count > 1
      name.split.last
    end
  end
end
