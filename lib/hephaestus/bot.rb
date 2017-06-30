require "hephaestus/bot/version"
require "olimpo"

module Hephaestus
  module Bot
    extend Olimpo
    autoload :Environments, 'hephaestus/bot/environments'
    autoload :Collections. 'hephaestus/bot/collections'
  end
end
