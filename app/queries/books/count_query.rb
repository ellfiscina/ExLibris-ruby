module Books
  class CountQuery < ApplicationQuery
    def self.call(user, params)
      new(user).query(params)
    end

    def initialize(user)
      @relation = user.books.all
    end

    def query(params)
      @relation = relation.where(status: params[:status]) if params[:status]
      @relation = relation.where(author: params[:author]) if params[:author]
      @relation = relation.where(editor: params[:editor]) if params[:editor]

      relation.count
    end
  end
end
