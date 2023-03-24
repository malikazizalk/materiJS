rumus dari bangun datar jajar genjang <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>membuat rumus bangun datar persegi</title>
</head>
<body>
    <h2>Bangun Datar Jajar Genjang</h2>

    <form action="" method="POST">
        <table>
            <tr>
                <td>alas</td>
                <td>
                    <input type="text" name="alas" require>
                </td>
            </tr>
            <tr>
                <td>tinggi</td>
                <td>
                    <input type="text" name="tinggi" require>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="submit" name="submit" value="hitung">
                </td>
            </tr>
        </table>
    </form>

    <?php
        if(isset($_POST['submit'])){
            $a = $_POST['alas'];
            $t = $_POST['tinggi'];

            $luasJjg = $a * $t;

            echo 'hasil perhitungan luas bangun datar jajar genjang';
            echo '<br> dik : ';
            echo '<br> alas : '.$a;
            echo '<br> tinggi : '.$t;

            echo '<br> maka luasnya = '.$luasJjg;
        }
    ?>
</body>
</html>