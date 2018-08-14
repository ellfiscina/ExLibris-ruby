class ApplicationQuery
  attr_accessor :relation

  delegate :first, :find, :find_by, :last, :count, :any?, to: :relation

  def all
    includes.relation
  end

  def build(attributes = {})
    all.new(attributes)
  end

  def includes
    self
  end

  def find(id)
    relation.find_by(id: id)
  end

  def search_ilike_for(columns, term)
    return self unless term
    params = { t: "%#{alphanumeric_term_to_query(term)}%" }
    columns = columns.map { |column| "unaccent(#{column}) ILIKE unaccent(:t)" }
    @relation = relation.where(columns.join(' OR '), params)

    self
  end

  def decorate
    ActiveDecorator::Decorator.instance.decorate(relation)
  end

  private

  def alphanumeric_term_to_query(term)
    term.to_s.gsub(/[^a-z0-9\s]/i, '').downcase
  end
end
