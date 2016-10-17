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

// Register Activity
$(document).ready(function(){
    $('#activityRegisterButton').on('click', function(){
        $.ajax({
            type: 'POST',
            contentType: 'application/json',
            url: ctxPath + "/resources/activities/register",
            dataType: 'json',
            data: JSON.stringify($.('form').serializeObject())
        })
    })
})

// <-- User Methods -->
// Find all users and display them in a jQuery Datatables
$(document).ready(initUserListTable);
    function initUserListTable() {

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
};

// Register
$(document).ready(function(){
    $('#userRegisterButton').on("click", function(){
        $.ajax({
            type: 'POST',
            contentType: 'application/json',
            url: "/resources/users/register",
            datatype: "json",
            data: JSON.stringify($.('form').serializeObject())
        });
    });
});

// Helper functie om form velden om te zetten in JSON
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function(){
        if(o[this.name] !== undefined) {
            if(!o[this.name].push){
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        }
        else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};

// SuperFish initialisation
jQuery(document).ready(function(){
    jQuery('ul.sf-menu').supersubs({
        minWidth: 12,
        maxWidth: 27,
        extraWidth: 1
    }).superfish();
})

// Geocomplete Google Maps jQuery plugin
// function geocompleteFunction() {
//
//     $("#geocomplete").geocomplete({
//         map: ".googleMap",
//         mapOptions: {
//             zoom: 10
//         },
//         location: "Groningen",
//         details: ".addressForm"
//     });
//
//
//     $("#find").click(function(){
//         $("#geocomplete").trigger("geocode");
//     });
//
// };


