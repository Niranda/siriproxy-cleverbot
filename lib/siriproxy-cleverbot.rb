require 'cora'
require 'siri_objects'
require 'cleverbot'

#######
# Remember to add other plugins to the "config.yml" file if you create them!
######

class SiriProxy::Plugin::Cleverbot < SiriProxy::Plugin
def initialize(config)
end
   listen_for /Ich (will|möchte) mit dir (sprechen|erzählen|reden)/i do
      hResponse = ask "Was ist denn los?"
      until hResponse =~ /(Tschüss|auf Wiedersehen|bis bald|man sieht sich)/i do
         @cleverbot = ::Cleverbot::Client.write hResponse
         hResponse = ask "#{@cleverbot['message']}"
      end
      say "Bis dann..."
      request_completed
   end
end
