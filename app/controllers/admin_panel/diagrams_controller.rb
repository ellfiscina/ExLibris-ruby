class AdminPanel::DiagramsController < AdminPanelController
  def index
    %x(bundle exec erd --filename='public/diagram')
  end
end
