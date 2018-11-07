<!DOCKTYPE>

<html>

<head>

<title> Prueba BBDD </title>
<body>

<h1 align="center">  BBDD </h1>

<?php

$conexion= mysqli_connect("localhost","root","") or die ("No se pudo conectar: ".mysql_error());
echo "Connected successfully";
mysqli_select_db($conexion,"prueba") or die("No se pudo seleccionar la base de datos");

$query= "SELECT * FROM Corral";
$sql       = "SELECT * FROM Animal";
$resultado = mysqli_query($conexion,$sql);
if (!$resultado) {
    echo "Error de BD, no se pudo consultar la base de datos\n";
    echo "Error MySQL: ' . mysql_error()";
    exit;
}
while ($fila = mysqli_fetch_assoc($resultado)) {
	echo "<br> </br>";
	echo $fila["peso"];
    //echo $fila["idAnimal"];
}

mysqli_free_result($resultado);

mysqli_close($conexion);
?>

</body>

</head>


</html>