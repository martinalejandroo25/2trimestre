#Crea un SCRIPT que muestre un menú al usuario con las siguientes operaciones:
#1. Mostrar directorio.
#2. Crear directorio.
#3. Eliminar directorio.
#4. Cambiar a un directorio, ver su contenido y volver al directorio anterior.
#5. Salir.
#Una vez elegida una opción correcta el programa debe solicitar un nombre de directorio y hacer la
#operación seleccionada.
#El menú debe repetirse mientras no se pulse la opción de salir.
#Cada operación debe realizarse en una función independiente.

while($opcion -ne 5) {
    menu
}

function menu {
    write "*****************************************"
    write "1. Mostrar Directorio"
    write "2. Crear Directorio"
    write "3. Eliminar Directorio"
    write "4. Cambiar a un directorio, ver su contenido y volver al directorio anterior"
    write "5. Salir"
    write "*****************************************"
    $opcion= Read-Host

    switch($opcion) {
        "1" {mostrarDirectorio}
        "2"{crearDirectorio}
        "3" {eliminarDirectorio}
        "4" {cambiarDirectorio}
        "5" {write-host "Adios :)"; exit 0}
    }
}

function mostrarDirectorio {
    $directorio= read-host Que directorio quiere visualizar?
        get-ChildItem $directorio
}

function crearDirectorio {
    $directorio= read-host Que nombre le darás al nuevo directorio?
        if(Test-Path $directorio -PathType Container) {
            Write-Host "Directorio $directorio ya fue creado"
        } 
        else {
            New-Item -ItemType Directory $directorio
            Write-Host "Directorio creado exitosamente"
            }
}

function eliminarDirectorio {
    $directorio= read-host Que directorio deseas eliminar?
        if(Test-Path $directorio -PathType Container) {
            Remove-Item $directorio
            Write-Host "Directorio eliminado con exito"
        } 
        else {
            Write-Host "El directorio no existe"
        }
}

function cambiarDirectorio {
   # Guarda el directorio actual
    $dirActual = Get-Location

    # Solicita al usuario que ingrese la ruta del directorio al que desea cambiar
    $directorio = Read-Host "Ingrese la ruta del directorio al que desea cambiar"

    # Verifica si el directorio especificado existe
    if (Test-Path $directorio -PathType Container) {
        # Cambia al directorio especificado
        Set-Location $directorio

        # Muestra el contenido del directorio
        Get-ChildItem

        # Vuelve al directorio anterior
        Set-Location $dirActual
    } else {
        Write-Host "El directorio especificado no existe."
    }
}