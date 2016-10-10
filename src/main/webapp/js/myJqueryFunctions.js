/**
 * Created by douwejongeneel on 04/10/2016.
 */

var ctxPath = "http://localhost:8080/workshop3.rest";

// <-- Activity Methods -->

// small table for activities home page
$(document).ready(function(){
   $('#activityTableShort').DataTable({

       "ajax" : {
           "url" : ctxPath + "/activities/getAll",
           "dataSrc" : ""
       },
       "columns" : [
           {'data': 'id'},
           {'data': 'name'},
           {'data': 'price'}
       ]
   });
});

// <-- User Methods -->
// Find all users and display them in a jQuery Datatables
$(document).ready(function(){
    $('#userTable').DataTable({

        "ajax" : {
            "url" : ctxPath + "/resources/users",
            "dataSrc" : ""
        },
        "columns" : [
            {'data': 'firstname'},
            {'data': 'insertion'},
            {'data': 'lastname'},
            {'data': 'phone'},
            {'data': 'email'}
        ]
    });
});

// Register
$(document).ready(function(){
    $('#userRegisterButton').on("click", function(){
        $.ajax({
            type: 'POST',
            contentType: 'application/json',
            url: "/resources/users/register",
            datatype: "json",
            data: formToJSON()
        });
    });
});

// Helper functie om form velden om te zetten in JSON
function formToJSON() {
    return JSON.stringify({
        "firstname": $('#firstname').val(),
        "insertion" : $('#insertion').val(),
        "lastname" : $('#lastname').val(),
        "phone" : $('#phone').val(),
        "email" : $('#email').val,
        "password" : $('#password').val()
    })
}

// SuperFish initialisation
jQuery(document).ready(function(){
    jQuery('ul.sf-menu').supersubs({
        minWidth: 12,
        maxWidth: 27,
        extraWidth: 1
    }).superfish();
})
