module Editors
  class ByParamsQuery < ApplicationQuery
    def self.call(params)
      new.query(params)
    end

    def initialize
      @relation = Editor.all
    end

    def query(params)
      @relation = select_by_name(params[:query]) if params[:query]
      relation
    end

    private

    def select_by_name(name)
      relation.where("lower(name) LIKE ?", "%#{name.downcase.rstrip()}%")
    end
  end
end
