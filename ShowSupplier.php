<?php
include 'conn.php'; 

session_start();

$sql = "SELECT `id`, `CompanyName`, `City`, `Country`, `Phone`, `Email` FROM supplier";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
    // output data of each row
    while($row = $result->fetch_assoc()) 
    {
        echo "id: " . $row["id"]. " - CompanyName: " . $row["CompanyName"]. " - City: " . $row["City"]. " - Country: " . $row["Country"]. " - Phone: " . $row["Phone"]. " - Email: " . $row["Email"]. "<a href='DeleteSupplier.php?ID=" .$row['id']."'> Delete </a>". "<br>";
    }
} else {
    echo "0 results";
}
$conn->close();
?>


<!DOCTYPE html>
<html>
    <head>
        <title></title>
    </head>
    
    <body>
        
        <form action="index.php">
        <input type="submit" value="Start screen"/>
        </form>
    
    </body>

</html>