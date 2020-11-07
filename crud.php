<?php 
include 'db_connect.php';

 $sql = 'SELECT id, sport, team1, team2, bet_date, league, bet_guess, bet_result, bet_rate  FROM bet_screen';

$query = mysqli_query($connect, $sql);
$result = [];
   while($r = mysqli_fetch_assoc($query)) {
    $rows[] = $r;
}
    print json_encode($rows);
 
 ?>


