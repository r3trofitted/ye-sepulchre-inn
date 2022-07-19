module CurrentPlayer
  extend ActiveSupport::Concern
  
  included do
    before_action :set_current_player
  end
  
  private
  
  def set_current_player
    Current.player = Player.find_by(id: session[:player_id])
  end
end