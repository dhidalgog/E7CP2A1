#Crear un menú que permita registrar la información de los alumnos del curso.

# Methods

def mostrar_menu
  puts '  ----------------------------------------------------------------------------------'
  puts ' |                                   MENU                                           |'
  puts '  ----------------------------------------------------------------------------------'
  puts ' |Opción 1 - Ingresar los datos de una persona                                      |'
  puts ' |Opción 2 - Editar los datos de la persona                                         |'
  puts ' |Opción 3 - Eliminar una persona                                                   |'
  puts ' |Opción 4 - Cantidad de personas ingresadas                                        |'
  puts ' |Opción 5 - Mostrar las comunas de todas las personas                              |'
  puts ' |Opción 6 - Lista con todas las personas que tengan entre 20 y 25 años             |'
  puts ' |Opción 7 - Suma de las edades de todas las personas                               |'
  puts ' |Opción 8 - Promedio de las edades del grupo                                       |'
  puts ' |Opción 9 - Mostrar dos listas de personas, una por cada género                    |'
  puts ' |Opción 10 - Salir                                                                 |' 
  puts "  ----------------------------------------------------------------------------------\n\n"
end

def validar_opcion(opcion)
  while opcion < 1 || opcion > 10
    system('clear')
    puts "\nLa opción ingresada no es válida"
    puts "Ingrese una opcion entre 1 y 10\n\n"
    mostrar_menu
    opcion = gets.chomp.to_i
  end
  opcion
end

#Opción 1: Permite ingresar los datos de una persona:
#Nombre
#Edad
#Comuna
#Género
def ingresar_persona(arr_personas)
  new_hash = {}
  puts 'Ingresar Nombre:'
  new_hash.store(:nombre, gets.chomp)
  puts 'Ingresar Edad:'
  new_hash.store(:edad, gets.chomp.to_i)
  puts 'Ingresar Comuna:'
  new_hash.store(:comuna, gets.chomp)
  puts 'Ingresar Género:'
  new_hash.store(:genero, gets.chomp)
  puts new_hash
  arr_personas.push(new_hash)
  arr_personas
end
#Opción 2: Permite editar los datos de la persona.
def editar_persona(nombre, arr_personas)
  arr_personas.each do |e|
    if e.value?(nombre)
      new_hash = {}
      puts "Persona encontrada: #{nombre}"
      puts "Ingresar nueva edad"
      new_hash.store(:edad, gets.chomp.to_i)
      puts "Ingresar nueva comuna"
      new_hash.store(:comuna, gets.chomp)
      puts "Persona Editada: #{nombre}"
      return e.merge!(new_hash)
    else
      return "Persona no encontrada"
    end
  end
end

#Opción 3: Permite eliminar una persona.
def eliminar_persona(nombre, arr_personas)
  arr_personas.each_index do |i|
    if arr_personas[i].value?(nombre)
      puts "Persona encontrada"
      arr_personas.delete_at(i)
      puts "La personsa #{nombre} ha sido eliminada"
      return arr_personas
    else
      return "Persona no encontrada"
    end
  end
end

#Opción 4: Muestra la cantidad de personas ingresadas.
def personas_ingresadas(arr_personas)
  arr_personas.size
end

#Opción 5: Muestra las comunas de todas las personas.
#hint: Generar un array con las comunas, eliminar repeticiones. Considerar que pueden haber nombres escritos con mayúscula y minúscula.
def mostrar_comunas(arr_personas)
  arr_comunas = []
  arr_personas.each do |e|
    arr_comunas.push(e[:comuna]) if !arr_comunas.include?(e[:comuna])
  end
  arr_comunas
end

#Opción 6: Muestra una lista con todas las personas que tengan entre 20 y 25 años.
def personas_2025(arr_personas)
  personas_2025 = []
  arr_personas.each do |e|
    personas_2025.push(e[:nombre]) if e[:edad] >= 20 && e[:edad] <= 25
  end
  personas_2025
end

#Opción 7: Muestra la suma de las edades de todas las personas.
def suma_edades(arr_personas)
  suma = 0
  arr_personas.each { |e| suma += e[:edad] }
  suma
end
#Opción 8: Muestra el promedio de las edades del grupo.

#Opción 9: Muestra dos listas de personas, una por cada género.
def listas_genero(arr_personas)
  masculino = []
  femenino = []
  arr_personas.each do |e|
    if e[:genero] == 'Masculino'
      masculino.push(e[:nombre])
    else
      femenino.push(e[:nombre])
    end
  end
  puts "Genero Masculino: #{masculino}"
  puts "Genero Femenino: #{femenino}"
end
#El menú debe repetirse hasta que el usuario ingrese la opción 10 (salir)

# Ejecución
personas = [
  {nombre: 'Daniel', edad: 24, comuna: 'Macul', genero: 'Masculino'},
  {nombre: 'Patricio', edad: 24, comuna: 'Maipu', genero: 'Masculino'},
  {nombre: 'Francisca', edad: 25, comuna: 'Macul', genero: 'Femenino'},
  {nombre: 'Romina', edad: 23, comuna: 'Ñuñoa', genero: 'Femenino'}
]

system('clear')
puts "Bienvenido\n"
opcion = 0
while opcion != 10
  mostrar_menu
  puts "\nIngrese una opcion"
  opcion = gets.chomp.to_i
  opcion = validar_opcion(opcion)
  system('clear')
  case opcion
  when 1
    puts "Opción 1: Ingresar los datos de una persona\n\n"
    puts ingresar_persona(personas)
    puts "Personas"
    puts personas
  when 2
    puts "Opción 2: Editar los datos de la persona\n\n"
    puts "Ingrese el nombre de la persona que desea editar"
    nombre = gets.chomp
    puts editar_persona(nombre, personas)
    puts "\nPersonas"
    puts personas
  when 3
    puts "Opción 3: Eliminar una persona\n\n"
    puts "Ingrese el nombre de la persona que desea eliminar"
    nombre = gets.chomp
    puts eliminar_persona(nombre, personas)
    puts "\nPersonas"
    puts personas
  when 4
    puts "Opción 4: Cantidad de personas ingresadas\n\n"
    puts "Personas ingresadas:"
    puts personas_ingresadas(personas)
  when 5
    puts "Opción 5: Mostrar las comunas de todas las personas\n\n"
    puts "Comunas"
    puts mostrar_comunas(personas).to_s
  when 6
    puts "Opción 6: Lista con todas las personas que tengan entre 20 y 25 años\n\n"
    puts "Personas entre 20 y 25 años"
    puts personas_2025(personas).to_s
  when 7
    puts "Opción 7: Suma de las edades de todas las personas\n\n"
    puts suma_edades(personas)
  when 8
    puts "Opción 8: Promedio de las edades del grupo\n\n"
    puts suma_edades(personas)/personas.size.to_f
  when 9
    puts "Opción 9: Mostrar dos listas de personas, una por cada género\n\n"
    listas_genero(personas)
  end
end

system('clear')
puts 'bye'
