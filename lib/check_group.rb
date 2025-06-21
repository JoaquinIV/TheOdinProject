class CheckGroup

    attr_reader :casillas, :tablero, :all_equal

    def initialize(casillas, tablero)
        @casillas = casillas
        @tablero = tablero
        @all_equal = false
    end

    def check_group(state)
        has_state = true
        @casillas.each do |casilla|
            if !casilla.has_state?(state)
                has_state = false
            end
        end
        has_state
    end

    def update(casilla)
        if check_group(casilla.state)
            @all_equal = true
            @tablero.update(self)
        else
            @all_equal = false
        end
    end

end