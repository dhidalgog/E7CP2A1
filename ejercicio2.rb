nombres = ["Violeta", "Andino", "Clemente", "Javiera", "Paula", "Pia", "Ray"]

# Extraer todos los elementos que excedan mas de 5 caracteres utilizando el método .select.
arr_5 = nombres.select { |s| nombres.delete(s) if s.length > 5 }
puts arr_5.to_s
# Utilizando .map crear una arreglo con los nombres en minúscula.
arr_min = nombres.map(&:downcase)
puts arr_min.to_s
# Utilizando .select para crear un arreglo con todos los nombres que empiecen con P.
arr_P = nombres.select{ |s| s.start_with?('P') }
puts arr_P.to_s
# Utilizando .map crear un arreglo único con la cantidad de letras que tiene cada nombre.
arr_P += nombres
nombres = arr_P
arr_letras = nombres.map(&:length)
puts arr_letras.to_s
# Utilizando .map y .gsub eliminar las vocales de todos los nombres .
without_vowels = nombres.map do |s|
  s.gsub(/[AEIOUaeiou]/, '')
end
puts without_vowels.to_s
