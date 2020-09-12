<?php
$conn = mysqli_connect('localhost', 'root', '', 'hoteldb' );
				if(mysqli_connect_errno())
				{
					echo 'Ошибка подключения к базе данных.('.mysqli_connect_errno().'): '.mysqli_connect_error() ;
					die; 
                }
?>