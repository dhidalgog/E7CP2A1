a = [1, 2, 3, 9, 1, 4, 5, 2, 3, 6, 6]

# Utilizando map generar un nuevo arreglo con cada valor aumentado en 1.
plus_1 = a.map { |i| i + 1 }
puts plus_1.to_s
# Utilizando map generar un nuevo arreglo que contenga todos los valores convertidos a float.
arr_float = a.map(&:to_f)
puts arr_float.to_s
# Utilizando map generar un nuevo arreglo que contenga todos los valores convertidos a string.
arr_string = a.map(&:to_s)
puts arr_string.to_s
# Utilizando reject descartar todos los elementos menores a 5 en el array.
less_5 = a.reject { |i| i < 5 }
puts less_5.to_s
# Utilizando select descartar todos los elementos mayores a 5 en el array.
greater_5 = a.reject { |i| i > 5 }
puts greater_5.to_s
# Utilizando inject obtener la suma de todos los elementos del array.
sum = a.inject(:+)
puts sum
# Utilizando group_by agrupar todos los números por paridad (si son pares, es un grupos, si son impares es otro grupo).
arr_even = a.group_by(&:even?)
puts arr_even
arr_odd = a.group_by(&:odd?)
puts arr_odd
# Utilizando group_by agrupar todos los números mayores y menores que 6.
greater_6 = a.group_by { |i| i != 6 }
puts greater_6
