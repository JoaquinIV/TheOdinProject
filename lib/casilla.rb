class Casilla

    attr_reader :x, :y
    attr_accessor :state

    def initialize(x, y)
        @x = x
        @y = y
        @state = ''
        @listeners = []
    end

    def notify_listeners
        @listeners.each do |listener|
            listener.update(self)
        end
    end 

    def has_state?(state)
        @state == state
    end

    def state=(state)
        @state = state
        notify_listeners
    end

    def clear
        self.state = ''
    end

    def add_listener(listener)
        @listeners << listener
    end

    def remove_listener(listener)
        @listeners.delete(listener)
    end

end