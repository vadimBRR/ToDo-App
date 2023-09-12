<!doctype html>
<html lang="en" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
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

        .table {
            background-color: transparent;
        }

        .table tr,
        .table tbody td,
        .table tbody th {
            background-color: transparent;
            color: white;
        }


        .color1 {
            color: #FFD200;
        }

        .color2 {
            color: #FF3100;
        }

        .nav-tabs .nav-link:not(.active) {
            color: white; /* Set text color to white */
        }

        .itd-button {
            background: white;
            color: black;
        }

        /*    */

    </style>
</head>
<body>
<header>
    <div class="mt-5 container itd-main  w-75">

        <div class="mt-5 mb-5 pb-5">
            <div class="row mt-5 mb-3 justify-content-center align-items-center text-center">

                <div class="col-lg-auto d-flex justify-content-end align-items-center ">
                    <h1 class="text-uppercase text-white m-1 me-3">Todo App</h1>
                    <a href="/logout" class="btn btn-outline-light "> <i class="fas fa-arrow-right-from-bracket"></i></a>

                </div>
            </div>
            <div class="row">
                <div class="col-sm-auto">
                    <h3 class="text-white">Main Page</h3>
                </div>

                <div class="col-sm">
                    <form action="/add" method="post">
                        <div class="input-group flex-nowrap">
                            <input type="text" name="task" value="${newtask}" class="form-control" placeholder="Add task"
                                   aria-label="add" aria-describedby="addon-wrapping">
                            <button class="btn input-group-text btn-outline-light itd-button " id="addon-wrapping"
                                    data-bs-toggle="dropdown" href="#" role="button" aria-expanded="false">
                                <i class="far fa-calendar"></i>
                            </button>
                            <ul class="dropdown-menu">
                                <li><a id="todayLink" class="dropdown-item btn btn-outline-light active"
                                       onclick="setTaskDate('today')">Today</a></li>
                                <li><a id="tomorrowLink" class="dropdown-item btn btn-outline-light"
                                       onclick="setTaskDate('tomorrow')">Tomorrow</a></li>
                                <liv>
                                    <input class="dropdown-item" type="date" id="date" name="taskDate" value="${taskDate}"
                                           onclick="setTaskDate('changeDay')"/>
                                </liv>

                            </ul>
                            <button class="btn input-group-text btn-outline-light itd-button" id="addon-wrapping"
                                    type="submit">
                                <i class="fas fa-plus text-gray"></i>
                            </button>

                        </div>
                    </form>
                </div>
            </div>

            <hr class="text-white">
            <ul class="nav nav-tabs">
                <li class="nav-item">
                    <#if activeTab == "all">
                        <a type="button" class="nav-link active" href="/?activeTab=all">All</a>
                    <#else>
                        <a type="button" class="nav-link" href="/?activeTab=all">All</a>
                    </#if>
                </li>
                <li class="nav-item">
                    <#if activeTab == "today">
                        <a type="button" class="nav-link active" href="/?activeTab=today"><h4>Today</h4></a>
                    <#else>
                        <a type="button" class="nav-link" href="/?activeTab=today">Today</a>
                    </#if>
                </li>
                <li class="nav-item">
                    <#if activeTab == "tomorrow">
                        <a type="button" class="nav-link active" href="/?activeTab=tomorrow">Tomorrow</a>
                    <#else>
                        <a type="button" class="nav-link" href="/?activeTab=tomorrow">Tomorrow</a>
                    </#if>
                </li>
                <li class="nav-item">
                    <#if activeTab == "completed">
                        <a type="button" class="nav-link active" href="/?activeTab=completed">Completed</a>
                    <#else>
                        <a type="button" class="nav-link" href="/?activeTab=completed">Completed</a>
                    </#if>
                </li>
            </ul>


            <table class="table ">
                <thead>
                <tr>
                    <th scope="col">#</th>
                    <th scope="col">Task</th>
                    <th scope="col">Date</th>
                    <#--                <th scope="col">Status</th>-->
                    <th scope="col" class="text-center">Actions</th>
                </tr>
                </thead>
                <tbody>
                <#list tasks as task>
                <tr>
                    <#if task.status>
                        <td><input class="form-check-input me-2" type="checkbox" value="" aria-label="..." checked/>
                        </td>
                    <#else >
                        <form action="/change-status/${task.id}" method="post">
                            <td>
                                <button class="form-check-input me-2" type="checkbox" name="status" value="unchecked"
                                        aria-label="..."/>
                            </td>
                        </form>
                    </#if>
                    <td>${task.task}</td>
                    <#if task.date.equals(today)>
                        <td>Today</td>
                    <#elseif task.date.equals(tomorrow)>
                        <td>Tomorrow</td>
                    <#else>
                        <td>${task.date}</td>
                    </#if>
                    <td class="text-center">
                        <div class="d-flex justify-content-center align-items-center">

                            <button type="button" class="btn" data-bs-toggle="modal" data-bs-target="#exampleModal" data-bs-id="${task.id}" data-bs-task="${task.task}" data-bs-date="${task.date}">
                                <i class="fas fa-pen-to-square fa-lg color1 me-3"></i>
                            </button>

                            <form method="post" action="/delete/${task.id}">
                                <button type="submit" data-mdb-toggle="tooltip" title="Remove" class="btn"><i
                                            class="fas fa-trash-alt fa-lg color2"></i></button>
                            </form>
                        </div>
                    </td>
                </tr>
                <#else>
            </table>
            <h2 class="text-center text-white">Add something</h2>
            </#list>

            </tbody>

            </table>
        </div>
        <!-- Modal -->

        </div>
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <form action="/edit" method="post">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Edit Task</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="id-div">
                            <input type="hidden" id="id" name="id">
                        </div>
                        <div class="mb-3 task-div">
                            <label for="recipient-name" class="col-form-label">Task:</label>
                            <input type="text" class="form-control" id="task" name="task">
                        </div>
                        <div class="mb-3 date-div">
                            <label for="message-text" class="col-form-label">Date:</label>
                            <#--                                <input class="form-control" id="message-text" name="date"></input>-->
                            <input type="date" id="date" name="date" class="form-control" />


                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Edit task</button>
                    </div>
                </form>

            </div>
        </div>
    </div>
</header>
<script>
        const exampleModal = document.getElementById('exampleModal')
        if (exampleModal) {
            exampleModal.addEventListener('show.bs.modal', event => {
                const button = event.relatedTarget
                const id = button.getAttribute('data-bs-id')
                const task = button.getAttribute('data-bs-task')
                const date = button.getAttribute('data-bs-date')

                const modalId = exampleModal.querySelector('.id-div input')
                const modalTask = exampleModal.querySelector('.task-div input')
                const modalDate = exampleModal.querySelector('.date-div input')

                modalId.value = id;
                modalTask.value = task;
                modalDate.value = date;
            })
        }

    function setTaskDate(option) {
        if (option === "today") {
            document.getElementById('date').value = "${today}";
            document.getElementById('todayLink').classList.add('active');
            document.getElementById('tomorrowLink').classList.remove('active');
            document.getElementById('date').classList.remove('active');
        } else if (option === "tomorrow") {
            document.getElementById('date').value = "${tomorrow}";
            document.getElementById('tomorrowLink').classList.add('active');
            document.getElementById('todayLink').classList.remove('active');
            document.getElementById('date').classList.remove('active');
        } else {
            document.getElementById('tomorrowLink').classList.remove('active');
            document.getElementById('todayLink').classList.remove('active');
            document.getElementById('date').classList.add('active');

        }


    }


    <#--function formatDate(date) {-->
    <#--    const year = date.getFullYear();-->
    <#--    const month = (date.getMonth() + 1).toString().padStart(2, "0");-->
    <#--    const day = date.getDate().toString().padStart(2, "0");-->
    <#--    return `${year}-${month}-${day}`;-->
    <#--}-->

</script>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
</body>
</html>