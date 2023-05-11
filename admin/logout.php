<?php
session_start();

unset($_SESSION['MEMBER']);
header('Location:/msibphp/materi_msib_htp');
?>