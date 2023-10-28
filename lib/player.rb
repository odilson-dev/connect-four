class Player
    attr_reader :token, :name

    def initialize(name, token)
        @name = name
        @token = token
    end
end