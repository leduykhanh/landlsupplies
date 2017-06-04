<?php

/**********************************************************************
 *Contains all the basic Configuration
 *dbHost = Host of your MySQL DataBase Server... Usually it is localhost
 *dbUser = Username of your DataBase
 *dbPass = Password of your DataBase
 *dbName = Name of your DataBase
 **********************************************************************/
$dbHost = 'localhost';
$dbUser = 'firetronics_jk';
$dbPass = 'JangkooI$HanSom3';//'admin@123';
$dbName = 'firetronics';
$con = mysqli_connect($dbHost, $dbUser, $dbPass, $dbName)
        or die('Error Connecting to MySQL DataBase');

date_default_timezone_set('Europe/Bucharest')
?>
