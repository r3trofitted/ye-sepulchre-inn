class GameChannel < ActionCable::Channel::Base
  extend Turbo::Streams::Broadcasts, Turbo::Streams::StreamName
  include Turbo::Streams::StreamName::ClassMethods

  def subscribed
    @player = Player.find(params[:player_id])
    super
  end
  
  def unsubscribed
    @player.destroy
  end
end
