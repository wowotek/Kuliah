<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Kalkulator - Result</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="css/bulma.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="title" id="top-title">Selamat Datang <%=session.getAttribute("nama")%> - <%=session.getAttribute("nim")%></div>
        <div id="middle-container">
            <div id="form-containers">
                <form action="Logout" method="post">
                    <label class="label">Hasil Penjumlahan :</label>
                        <label class="label is-medium has-text-white">&emsp;&emsp;<%=session.getAttribute("hasil-tambah")%></label>
                    <label class="label">Hasil Pengurangan :</label>
                        <label class="label is-medium has-text-white">&emsp;&emsp;<%=session.getAttribute("hasil-kurang")%></label>
                    <label class="label">Hasil Perkalian :</label>
                        <label class="label is-medium has-text-white">&emsp;&emsp;<%=session.getAttribute("hasil-kali")%></label>
                    <label class="label">Hasil Pembagian :</label>
                        <label class="label is-medium has-text-white">&emsp;&emsp;<%=session.getAttribute("hasil-bagi")%></label>

                    <input class="button is-link is-fullwidth" type="submit" value="Logout dan Kembali">               
                </form>
            </div>
        </div>
    </body>
</html>
