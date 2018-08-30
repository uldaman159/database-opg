<?php
include 'conn.php';
    
$ProductName ="";
$UnitPrice ="";


if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $ProductName = $_POST["ProductName"];
    $UnitPrice = $_POST["UnitPrice"];
    
    
    
    $sql = "INSERT INTO `product` (`ProductName`, `UnitPrice`) VALUES ('".$ProductName."','".$UnitPrice."')";
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
    
        <form action="AddProduct.php" method="post">
        <input type="text" placeholder="Enter ProductName" name="ProductName"> <br>
        <input type="text" placeholder="Enter UnitPrice" name="UnitPrice"> <br> <br>
        <input type="submit" value="Submit">
        </form>
        
        <br>
        
        <form action="index.php">
        <input type="submit" value="Start screen"/>
        </form>
        
    </body>

</html>