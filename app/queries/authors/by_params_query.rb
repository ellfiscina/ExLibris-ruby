module Authors
  class ByParamsQuery < ApplicationQuery
    def self.call(params)
      new.query(params)
    end

    def initialize
      @relation = Author.all
    end

    def query(params)
      relation.where("lower(name) LIKE ?", "%#{params[:query].downcase.rstrip()}%")
    end

    private

    def select_by_shelf(shelf)
      relation.where(shelf: shelf)
    end

    def select_by_status(status)
      relation.where(status: status)
    end
    def select_by_title(title)
      relation.where("lower(title) LIKE ?", "%#{title.downcase.rstrip()}%")
    end
  end
end
