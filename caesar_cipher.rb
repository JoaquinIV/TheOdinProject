def caesar_cipher(message, shift)
  alphabet = ("a".."z").to_a
  message_splitted = message.split("")
  message_cipher = ""
  message_splitted.map! do |character|
    index = alphabet.index(character.downcase) 
    if index.nil? 
      message_cipher += character
    else
      index = (index + shift) % alphabet.length
      if(character.downcase == character)
        message_cipher += alphabet[index]
      else
        message_cipher += alphabet[index].upcase
      end
    end
  end
  message_cipher
end
