module Books
  class MinMaxQuery < ApplicationQuery
    def self.call(user, params)
      new(user).query(params)
    end

    def initialize(user)
      @relation = user.books.all
    end

    def query(params)
      value = get_value(params)

      @relation = select_by_page(value) if params[:attr] == :pages
      @relation = select_by_year(value) if params[:attr] == :published

      relation.pluck(:title).push(value)
    end

    private
    def get_value(params)
      value = get_max(params[:attr]) if params[:type] == 'max'
      value = get_min(params[:attr]) if params[:type] == 'min'
      value
    end

    def select_by_page(pages)
      relation.select(:title).where(pages: pages)
    end

    def select_by_year(year)
      relation.select(:title).where(published: year)
    end

    def get_max(attr)
      relation.where.not(shelf: 2).maximum(attr)
    end

    def get_min(attr)
      relation.where.not(shelf: 2).minimum(attr)
    end
  end
end
