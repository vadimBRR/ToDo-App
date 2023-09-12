
<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style type="text/css">
        body{
            background: rgb(168,55,253);
            background: linear-gradient(90deg, rgba(168,55,253,1) 0%, rgba(28,181,255,1) 100%);
        }
        .itd-main{
            background: rgba(24, 24, 16, 0.2);
            border-radius: 2em;
            backdrop-filter: blur(25px);
            border: 2px solid rgba(255, 255, 255, 0.05);
            background-clip: padding-box;
            box-shadow: 10px 10px 10px rgba(46, 54, 68, 0.03);
        }
        .table {
            background-color: transparent;
        }

        .table tr,
        .table tbody td,
        .table tbody th {
            background-color: transparent;
            color: white;
        }


        .color1{
            color: #FFD200	;
        }

        .color2{
            color: #FF3100	;
        }
        .nav-tabs .nav-link:not(.active) {
            color: white; /* Set text color to white */
        }


    </style>
</head>
<body>
<header>
    <div class="container itd-main mt-5 mb-5 pb-5">
        <div class="row mt-5 justify-content-center align-items-center text-center">

            <div class="col-lg-auto ">
                <h1 class="text-uppercase text-white">Todo App</h1>
            </div>

            <div class="col col-sm-1 ">
                <a href="/" class="btn btn-outline-light border-2" title="Add Task"><i class="fas fa-arrow-left"></i></a>
            </div>

        </div>

        <h4 class="text-white">Add Task</h4>
        <hr class="text-white">


<#--        <ul class="nav nav-tabs">-->
<#--            <li class="nav-item">-->
<#--                <#if activeTab == "all">-->
<#--                    <a type="button" class="nav-link active" href="/?activeTab=all">All</a>-->
<#--                <#else>-->
<#--                    <a type="button" class="nav-link" href="/?activeTab=all">All</a>-->
<#--                </#if>-->
<#--            </li>-->
<#--            <li class="nav-item">-->
<#--                <#if activeTab == "completed">-->
<#--                    <a type="button" class="nav-link active" href="/?activeTab=completed">Completed</a>-->
<#--                <#else>-->
<#--                    <a type="button" class="nav-link" href="/?activeTab=completed">Completed</a>-->
<#--                </#if>-->
<#--            </li>-->
<#--            <li class="nav-item">-->
<#--                <#if activeTab == "incomplete">-->
<#--                    <a type="button" class="nav-link active" href="/?activeTab=incomplete">Incomplete</a>-->
<#--                <#else>-->
<#--                    <a type="button" class="nav-link" href="/?activeTab=incomplete">Incomplete</a>-->
<#--                </#if>-->
<#--            </li>-->
<#--        </ul>-->


<#--        <table class="table">-->
<#--            <thead>-->
<#--            <tr>-->
<#--                <th scope="col">#</th>-->
<#--                <th scope="col">Task</th>-->
<#--                <th scope="col">Date</th>-->
<#--                <th scope="col">Status</th>-->
<#--                <th scope="col">Actions</th>-->
<#--            </tr>-->
<#--            </thead>-->
<#--            <tbody>-->
<#--            <tr>-->
<#--                <td><input class="form-check-input me-2" type="checkbox" value="" aria-label="..." checked /></td>-->
<#--                <td>Exercise</td>-->
<#--                <td>12/3/2023</td>-->
<#--                <td>Completed</td>-->
<#--                <td class="align-middle">-->
<#--                    <a href="#!" data-mdb-toggle="tooltip" title="Edit"><i-->
<#--                                class="fas fa-pen-to-square fa-lg color1 me-3"></i></a>-->
<#--                    <a href="#!" data-mdb-toggle="tooltip" title="Remove"><i-->
<#--                                class="fas fa-trash-alt fa-lg color2"></i></a>-->
<#--                </td>-->
<#--            </tr>-->
<#--            <tr>-->
<#--                <td><input class="form-check-input me-2" type="checkbox" value="" aria-label="..." /></td>-->
<#--                <td>Exercise</td>-->
<#--                <td>12/3/2023</td>-->
<#--                <td>Incomplete</td>-->
<#--                <td class="align-middle">-->
<#--                    <a href="#!" data-mdb-toggle="tooltip" title="Edit"><i-->
<#--                                class="fas fa-pen-to-square fa-lg color1 me-3"></i></a>-->
<#--                    <a href="#!" data-mdb-toggle="tooltip" title="Remove"><i-->
<#--                                class="fas fa-trash-alt fa-lg color2"></i></a>-->
<#--                </td>-->
<#--            </tr>-->
<#--            <tr>-->
<#--                <td><input class="form-check-input me-2" type="checkbox" value="" aria-label="..." /></td>-->
<#--                <td>Exercise</td>-->
<#--                <td>12/3/2023</td>-->
<#--                <td>Incomplete</td>-->
<#--                <td class="align-middle">-->
<#--                    <a href="#!" data-mdb-toggle="tooltip" title="Edit"><i-->
<#--                                class="fas fa-pen-to-square fa-lg color1 me-3"></i></a>-->
<#--                    <a href="#!" data-mdb-toggle="tooltip" title="Remove"><i-->
<#--                                class="fas fa-trash-alt fa-lg color2"></i></a>-->
<#--                </td>-->
<#--            </tr>-->
<#--            </tbody>-->
<#--        </table>-->
    </div>
</header>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
</body>
</html>