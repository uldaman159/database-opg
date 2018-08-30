<?php
include 'conn.php';
    
$CompanyName ="";
$City ="";
$Country ="";
$Phone ="";
$Email ="";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $CompanyName = $_POST["CompanyName"];
    $City = $_POST["City"];
    $Country = $_POST["Country"];
    $Phone = $_POST["Phone"];
    $Email = $_POST["Email"];
    
    
    
    $sql = "INSERT INTO `supplier` (`CompanyName`, `City`, `Country`, `Phone`, `Email`) VALUES ('".$CompanyName."','".$City."','".$Country."','".$Phone."','".$Email."')";
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
    
        <form action="AddSupplier.php" method="post">
        <input type="text" placeholder="Enter your name" name="CompanyName"> <br>
        <input type="text" placeholder="Enter your Lastname" name="City"> <br>
        <input type="text" placeholder="Enter city name" name="Country"> <br>
        <input type="text" placeholder="Enter country name" name="Phone"> <br>
        <input type="text" placeholder="Enter phonenumber" name="Email"> <br> <br>
        <input type="submit" value="Submit">
        </form>
        
        <br>
        
        <form action="index.php">
        <input type="submit" value="Start screen"/>
        </form>
        
    </body>

</html>