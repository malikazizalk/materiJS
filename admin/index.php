<?php
//memanggil dan memproses file bagian atas
include_once 'top.php';
//memanggil dan memproses bagian menu
include_once 'menu.php';
?>

<div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1>Selamat Datang di Web Admin</h1>
                        <?php
                        //algoritma untuk menangkap url agar masuk ke dalam index
                        $url = $_GET['url'];
                        if($url == 'dashboard'){
                            include_once 'dashboard.php';
                        } else if (!empty($url)){
                            include_once ''.$url.'.php';
                        } else {'dashboard.php';
                        
                        }
                        ?>
                    </div>
                </main>
</div>


<?php
//memanggil file bagian bawah
include_once 'buttom.php';
?>