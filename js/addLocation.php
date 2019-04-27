<?php
$servername = "localhost";
$username = "kyteloopuser";
$password = "68triumph";

$conn = new mysqli($servername, $username, $password);
if ($conn->connect_error) {
	die("connection failed" . $conn->connect_error);
}
$sql = "INSERT INTO LOCATIONS (longitude, latitude, name, description, photo) VALUES (1.0, 1.0, test, 'this is a test', null)";
if ($conn->query($sql) == TRUE) {
	echo "new record added";
} else {
	echo "Error: " .$sql . "<br>". $conn->error;
}
$conn->close();