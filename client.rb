require 'twitter'
require './config.rb'

class Client

  def initialize
    @client = get_client
  end

  def configurate
    Config.new('twitter').values
  end

  def get_client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = configurate['consumer_key']
      config.consumer_secret     = configurate['consumer_secret']
      config.access_token        = configurate['access_token']
      config.access_token_secret = configurate['access_token_secret']
    end
  end

  def tweet
    @client.update(phrase)
  end

  def phrase
    if rand(2)
      shipify(horse)
    else
      horsify(ship)
    end
  end

  def shipify(phrase)
    phrase.gsub(/horse/, "ship")
  end

  def horsify(phrase)
    phrase.gsub(/ship/, "horse")
  end

  def horse
    horses.sample
  end

  def ship
    ships.sample
  end

  def horses
    [
      "That's a horse of another color.",
      "It's a one-horse race.",
      "It's a one-horse town.",
      "That's just a stalking horse.",
      "Is this a Trojan horse?",
      "You backed the wrong horse.",
      "Stop beating a dead ship.",
      "Better get on your horse.",
      "Don't put the cart before the horse.",
      "Don't change horses in midstream.",
      "Get off your high horse.",
      "That's closing the barn door after the horse has bolted.",
      "Don't look a gift horse in the mouth.",
      "You could drive a coach and horses through that.",
      "I'm so hungry I could eat a horse.",
      "You eat like a horse.",
      "It's enough to choke a horse.",
      "Every horse thinks its own pack is heaviest.",
      "For want of a nail, the horse was lost. For want of a horse...",
      "Straight from the horse's mouth.",
      "Sometimes you have to get back on the horse that bucked you.",
      "Hold your horses!",
      "Home, James, and don't spare the horses.",
      "That's horse hockey.",
      "If wishes were horses, then beggars would ride.",
      "If two ride on a horse, one must ride behind.",
      "A nod is as good as a wink to a blind horse.",
      "I have to piss like a racehorse.",
      "You can lead a horse to water, but you can't make him drink.",
      "Wild horses couldn't drag me away.",
      "You're as strong as a horse."
    ]
  end

  def ships
    [
      "You're on a sinking ship.",
      "Abandon ship!",
      "It's like two ships passing in the night.",
      "This ship has sailed.",
      "Why do rats desert a sinking ship?",
      "It's enough to sink a ship.",
      "Loose lips sink ships.",
      "You run a tight ship around here.",
      "One hand for yourself, and one for the ship.",
      "Shape up or ship out.",
      "Who will steer our ship of state?",
      "Someday your ship will come in.",
      "I need to pump ship right now."
    ]
  end
end
