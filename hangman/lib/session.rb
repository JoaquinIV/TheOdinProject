class Session

    attr_reader :word, :letters_used, :lives

    def initialize(word)
        @word = word
        @letters_used = []
        @lives = 5
    end

    def self.load(hash)
        session = Session.new(hash["word"])
        for letter in hash["letters_used"] do
            session.add_letter(letter)
        end
        (session.lives - hash["lives"]).times do
            session.delete_live
        end
        session
    end

    def add_letter(letter)
        @letters_used << letter unless letters_used.include? letter
    end

    def delete_live
        @lives -= 1 if lives > 0
    end

    def has_lives?
        lives > 0
    end

    def serialize
        {
            "word" => word,
            "letters_used" => letters_used,
            "lives" => lives
        }
    end

    def print_status
        word_split = word.split("")
        word_split.map do |letter|
            result = letters_used.include?(letter) ? letter : "_"
            result
        end.join(" ")
    end

    def win?
        word.split("").all? { |letter| letters_used.include? letter }
    end

    def try_letter(letter)
        
        # Validar que la entrada sea una letra válida
        unless letter.is_a?(String) && letter.length == 1 && letter.match?(/[a-zA-Z]/)
            puts "Por favor, ingresa una sola letra válida"
            return false
        end

        # Normalizar la letra a minúscula
        letter = letter.downcase

        # Verificar si ya se probó esta letra
        if has_already_try? letter
            return false
        end

        # Agregar la letra a las probadas
        self.add_letter(letter)

        # Verificar si la letra está en la palabra
        unless has_letter? letter
            self.delete_live
            unless self.has_lives?
                puts "Perdiste el juego, la palabra era: #{word}"
                return :lose
            end
            return :lose_live
        end

        # Verificar si ganó
        if self.win?
            return :win
        end

        return :continue
    end

    private

    def has_already_try?(letter)
        letters_used.include? letter
    end

    def has_letter?(letter)
        word.split("").include? letter
    end

end