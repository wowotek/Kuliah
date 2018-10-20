<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Kalkulator</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <link rel="stylesheet" href="css/bulma.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="title" id="top-title">Kalkulator</div>
        <div id="middle-container" >
            <div id="form-containers" class="depan-only">
                <form id="calc-form" name="calc-form" action="Session" onsubmit="return checkInputs()" method="post">
                    <div class="field">
                        <label class="label">Nama</label>
                        <div class="control">
                          <input required class="input" type="text" placeholder="Erlangga Ibrahim" name="input-nama">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Nomor Induk Mahasiswa (NIM)</label>
                        <div class="control">
                          <input required class="input" type="text" placeholder="672020232" name="input-nim">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Angka 1</label>
                        <div class="control">
                          <input required class="input" type="text" placeholder="10" name="input-angka1">
                        </div>
                    </div>
                    <div class="field">
                        <label class="label">Angka 2</label>
                        <div class="control">
                          <input required class="input" type="text" placeholder="5" name="input-angka2">
                        </div>
                    </div>
                    <div class="field">
                        <div class="columns">
                            <div class="column">
                                <button class="button is-link is-fullwidth" type="submit" id="submit-button">Submit</button>
                            </div>
                            <div class="column">
                                <input class="button is-warning is-fullwidth" type="reset" value="Reset" onclick="resetInputs()">
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </body>
    <script type="text/javascript" src="script/form_check.js"></script>
</html>
