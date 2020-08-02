require 'rest-client'

class Notifier
    def initialize()
        @url = 'https://maker.ifttt.com/trigger/change/with/key/e7PWUQWsXJSFZnq85VejX7SQHoYaCbwXqSPTcvhtsY5'
    end
    def notify(title, price='unspecified')
        payload = {
            :value1 => title,
            :value2 => price
        }
        RestClient.post(@url, payload)
    end
end