# ##################################################################################
# Antoine De Araujo                                        Practica 1 - Ejercicio 1
# Eva Wen Diego Álvarez                             Sistemas Operativos - 2021-2022
# ##################################################################################

# ############################## Codigo parte ######################################
# ##################################################################################
# ############################## Lectura del archivo de Excel de conatctos #########
su root
while read Ligne
do echo "$Ligne"
# ############################## Lea y obtenga la parte de Valores #################
IFS='; ' read -r -a array <<< "$Ligne"
# Leer todos los elementos de la matriz y mostrarlos para comprobar
for index in "${!array[@]}"
do
    echo "$index ${array[index]}"
done
# Tengo las tres primeras letras del nombre
name="${array[1]}"
firstThree=${name:0:3}
# Dividir el nombre para obtener el segundo nombre
IFS='& ' read -r -a array2 <<< "${array[1]}"
# Tengo las tres primeras letras del segundo nombre
name4="${array2[0]}"
name2="${array2[1]}"
firstThree2=${name2:0:3}
# Tengo las tres primeras letras del apellido
name3="${array[2]}"
firstThree3=${name3:0:3}
# Creación de la contraseña con nuestras nuevas variables
password="$firstThree$firstThree2$firstThree3"
echo "password:" $password
# Tengo la identificación
id="${array[0]}"
# Creación del correo con nuestras nuevas variables
mail="$password""$id""@mail.es"
echo "mail: "$mail
# ############################## Parte de creación de archivos #####################
mkdir -p Directorio
role="${array[3]}"
cd Directorio
mkdir -p $role
cd $role
mkdir -p $password
cd $password
cp /home/usuario/Documentos/Practica1/Bienvenida.doc Bienvenido.doc
# ############################## Modificación de la parte del archivo Welcome #######
date=$(date '+%Y-%m-%d')
echo $date
sed -i -e 's/]//g' Bienvenido.doc
sed -i -e 's/[[]//g' Bienvenido.doc
sed -i -e 's/Fecha/'$date'/g' Bienvenido.doc
sed -i -e 's/Nombre_empleado/'$name3'/g' Bienvenido.doc
sed -i -e 's/Apellido1/'$name4'/g' Bienvenido.doc
sed -i -e 's/Apellido2/'$name2'/g' Bienvenido.doc
sed -i -e 's/login/'$password'/g' Bienvenido.doc
sed -i -e 's/mail/'$mail'/g' Bienvenido.doc
cd ..
cd ..
cd ..
done < contactos.csv
