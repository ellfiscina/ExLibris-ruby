class StatisticsController < HomeController
  def index
    @books = Book.all
    @lists = List.all
  end
end
