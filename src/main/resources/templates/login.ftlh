<!doctype html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="/static/css/style.css">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    <style type="text/css">
        body {
            background: rgb(168, 55, 253);
            background: linear-gradient(90deg, rgba(168, 55, 253, 1) 0%, rgba(28, 181, 255, 1) 100%);
        }

        .itd-main {
            background: rgba(24, 24, 16, 0.2);
            border-radius: 2em;
            backdrop-filter: blur(25px);
            border: 2px solid rgba(255, 255, 255, 0.05);
            background-clip: padding-box;
            box-shadow: 10px 10px 10px rgba(46, 54, 68, 0.03);
        }
        </style>
    <title>TODO APP</title>
</head>
<#--<#import "blocks/template.ftlh" as t>-->
<#--<@t.template user>-->
<body>
<#--<div class="mt-3 container mt-5 mb-5 pb-5 ">-->
        <div class="container py-5  h-100 d-flex justify-content-center align-items-center">
            <div class="row d-flex justify-content-center align-items-center h-100 w-50">
                <div class="col col-xl-10 ">
                    <div class="card" style="border-radius: 1rem; background: inherit">
                        <div class="row g-0 itd-main">

                            <div class=" col d-flex align-items-center">
                                <div class="card-body p-4 p-lg-5 text-white">

                                    <form action="/login" method="post">


                                                <h1 class="text-uppercase text-white">Todo App</h1>
                                        <h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Sign into your account</h5>

                                        <div class="form-outline mb-4">
                                            <input type="text" id="form2Example17" class="form-control form-control-lg"name="username" />
                                            <label class="form-label" for="form2Example17" >Username</label>
                                        </div>

                                        <div class="form-outline mb-4">
                                            <input type="password" id="form2Example27" class="form-control form-control-lg" name="password"/>
                                            <label class="form-label" for="form2Example27">Password</label>
                                        </div>

                                        <div class="pt-1 mb-4">
                                            <button type="submit" class="btn btn-dark btn-lg btn-block" type="button">Login</button>
                                        </div>
                                        <p class="mb-5 pb-lg-2 fw-bolder">Don't have an account? <a href="/registration"
                                                                                                                  style="color: #35f2fc;">Register here</a></p>
                                    </form>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<#--        </div>-->
<#--    <div class="row mt-5 mb-3 justify-content-center align-items-center text-center">-->

<#--        <div class="col-lg-auto ">-->
<#--            <h1 class="text-uppercase text-white m-1 me-3">Todo App</h1>-->
<#--        </div>-->
<#--    </div>-->
<#--    <h4 class="text-white">Login</h4>-->
<#--    <form action="/login" method="post" class="text-white">-->
<#--        <div class="form-group row mr-md-10">-->
<#--            <label for="inputEmail3" class="col-sm-2 col-form-label" >Username</label>-->
<#--            <div class="col-sm-10">-->
<#--                <input type="text" class="form-control" id="inputEmail3" placeholder="Username" name="username">-->
<#--            </div>-->
<#--        </div>-->
<#--        <div class="form-group row">-->
<#--            <label for="inputPassword3" class="col-sm-2 col-form-label" >Password</label>-->
<#--            <div class="col-sm-10">-->
<#--                <input type="password" class="form-control" id="inputPassword3" placeholder="Password" name="password">-->
<#--            </div>-->
<#--        </div>-->

<#--        <div class="form-group row">-->
<#--            <div class="col-sm-10">-->
<#--                <button type="submit" class="btn btn-primary">Sign in</button>-->
<#--            </div>-->
<#--        </div>-->
<#--    </form>-->
<#--    <a href="/registration">Зареєструватись</a>-->
</div>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
</body>
</html>
<#--</@t.template>-->