class Translator
  def translate(language)
    language.print
  end
end

class Spanish
  def print
    'translating into spanish'
  end
end

class German
  def print
    'translating into german'
  end
end

class French
  def print
    'translating into french'
  end
end


=begin
  if language == :spanish
      'translating into spanish'
    elsif language == :french
      'translating into french'
    elsif language == :german
      'translating into german'
    end
=end