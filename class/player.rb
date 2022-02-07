
class Player
    attr_accessor :name, :token

    def initialize

        @name = []
        @token = []
    end

    def create(name, token)

        @name.append(name)
        @token.append(token)
    end

end