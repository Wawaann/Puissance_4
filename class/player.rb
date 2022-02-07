
class Player
    attr_accessor :name, :token

    def initialize

        @name = @token = ""
    end

    def create(name, token)

        @name = name
        @token = token
    end

end