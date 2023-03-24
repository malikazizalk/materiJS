<form action="" method="POST">
    <label for="">username</label>
    <br>
    <input type="text" name="uname">
    <br>
    <label for="">password</label>
    <br>
    <input type="password" name="pw">
    <br>

    <input type="submit" name="login" value="login">
</form>

<?php 

$username = $_POST['uname'];
$password = $_POST['pw'];
$login = $_POST['login'];

if(isset($login)){
    echo 'hello '.$username.
    '<br> password anda '.$password; 
}

?>