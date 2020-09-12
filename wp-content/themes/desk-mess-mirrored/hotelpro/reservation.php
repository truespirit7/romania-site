<?php
include(get_template_directory() . "/hotelpro/database.php");
if(isset($_POST['lastname']) && isset($_POST['firstname']) && isset($_POST['firstname']) && isset($_POST['roomclass']) && 
isset($_POST['startDate']) && isset($_POST['countDays'])  && isset($_POST['roomID']))
{
    $fname = htmlentities(mysqli_real_escape_string($_POST['firstname']));
    $lname  = htmlentities(mysqli_real_escape_string($_POST['lastname']));
    $patronomyc = htmlentities(mysqli_real_escape_string($_POST['patronomyc']));
    $roomclass = htmlentities(mysqli_real_escape_string($_POST['roomclass']));
    $startdate = htmlentities(mysqli_real_escape_string($_POST['stardate']));
    $countDays = htmlentities(mysqli_real_escape_string($_POST['countDays']));
    $roomID = htmlentities(mysqli_real_escape_string($_POST['roomID']));
    // Добавление брони в бд
    

    // Добавление ФИО клиента
    $queryID ="SELECT id FROM customers VALUES('$fname','$lname')";
    $result = mysqli_query($conn, $queryID) or die("Ошибка " . mysqli_error($link));
    if($result == 0){
    $query ="INSERT INTO customers VALUES(NULL, '$fname','$lname')";
    $result = mysqli_query($conn, $query) or die("Ошибка " . mysqli_error($link));
    $queryID ="SELECT id FROM customers VALUES('$fname','$lname')";
    $result = mysqli_query($conn, $queryID) or die("Ошибка " . mysqli_error($link));
    }
    // 
    while ($row = mysqli_fetch_row($result)) {
        echo "<tr>";
            for ($j = 0 ; $j < 3 ; ++$j) echo "<td>$row[$j]</td>";
        echo "</tr>";
    }
    //$query ="INSERT INTO reserves VALUES(NULL, '$fname','$lname')";
    //$query ="INSERT INTO reserves VALUES(NULL, '$fname','$lname')"; 
}