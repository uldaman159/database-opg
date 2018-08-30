<?php
include 'conn.php';
    
$FirstName ="";
$LastName ="";
$City ="";
$Country ="";
$PhoneNumber ="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $FirstName = $_POST["FirstName"];
    $LastName = $_POST["LastName"];
    $City = $_POST["City"];
    $Country = $_POST["Country"];
    $PhoneNumber = $_POST["PhoneNumber"];
    
    
    
    $sql = "INSERT INTO `custermer` (`FirstName`, `LastName`, `City`, `Country`, `PhoneNumber`) VALUES ('".$FirstName."','".$LastName."','".$City."','".$Country."','".$PhoneNumber."')";
    echo "hey works";
    if ($conn->query($sql) === TRUE) 
    {
        echo "New record created successfully";
    } 
    else 
    {
        echo "Error: " . $sql . "<br>" . $conn->error;
    }
}       
?>

<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    
    <body>
    
        <form action="add.php" method="post">
        <input type="text" placeholder="Enter your name" name="FirstName"> <br>
        <input type="text" placeholder="Enter your Lastname" name="LastName"> <br>
        <input type="text" placeholder="Enter city name" name="City"> <br>
        <input type="text" placeholder="Enter country name" name="Country"> <br>
        <input type="text" placeholder="Enter phonenumber" name="PhoneNumber"> <br> <br>
        <input type="submit" value="Submit">
        </form>
        
        <br>
        
        <form action="index.php">
        <input type="submit" value="Start screen"/>
        </form>
        
    </body>

</html>