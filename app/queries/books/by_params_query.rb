module Books
  class ByParamsQuery < ApplicationQuery
    def self.call(user, params)
      new(user).query(params)
    end

    def initialize(user)
      @relation = user.books.all
    end

    def query(params)
      @relation = select_by_status(params[:status]) if params[:status]
      @relation = select_by_shelf(params[:shelf]) if params[:shelf]
      @relation = select_by_title(params[:query]) if params[:query]
      relation
    end

    private

    def select_by_shelf(shelf)
      relation.where(shelf: shelf)
    end

    def select_by_status(status)
      relation.where(status: status)
    end
    def select_by_title(title)
      relation.where("lower(title) LIKE ?", "%#{title.downcase}%")
    end
  end
end
