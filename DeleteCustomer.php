<?php 
include 'conn.php';
    
session_start();

if($_GET['ID'] != "")
{
    $ID = $_GET['ID'];
    $sql = "DELETE FROM custermer Where `ID` = '$ID'";
    
    $result = $conn->query($sql);
    
    header("Location: ShowCustomer.php");   
}
?>