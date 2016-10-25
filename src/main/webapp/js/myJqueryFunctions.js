/**
 * Created by douwejongeneel on 04/10/2016.
 */


var ctxPath = "http://localhost:8080/workshop3.rest";

var currentActivity;
var currentUser;

// <-- Activity Methods -->

// show all activities
function findAllActivities() {

    $.ajax({
        method: "GET",
        url: ctxPath + "/resources/activities",
        dataType: "json", //data of the response
        success: renderList
    });
}

function renderList(data) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var list = data == null ? [] : (data instanceof Array ? data : [data]);

    $.each(list, function(index, activity) {
        $('.agendaBody').append(
            '<div class="eventThumbnail thumbnail col-sm-3">'
            +  '<div class="jumbotron">'
            +     '<img src="' + activity.image + '" alt="Event Image">'
            + '</div>'
            +    '<div class="caption">'
            +       '<h3 class="h3-thumbnail-header" align="center">' + activity.name + '</h3>'
            +       '<p class="p-thumbnail-description">' + activity.description + '</p>'
            +       '<label for="btn-group">View: &ensp;</label>'
            +       '<div class="btn-group" role="group" aria-label="...">'
            +           '<a href="' + ctxPath + "/activities/activity/" + activity.id + '" role="button" class="btn btn-primary" id="activity' + activity.id +'">Activity</a>'
            +           '<a href="' + ctxPath + "/users/" + activity.organiser.role + "/"+ activity.organiser.id + '" role="button" class="btn btn-default" id="organiser' + activity.organiser.id + '">Organiser</a>'
            +       '</div>'
            +   '</div>'
            + '</div>'
        );
    });
}

function findAllCompanies() {

    $.ajax({
        method:"GET",
        url: ctxPath + "/resources/users/companies",
        dataType: "json",
        success: renderCompanyList
    });
}

function renderCompanyList(data) {
    // JAX-RS serializes an empty list as null, and a 'collection of one' as an object (not an 'array of one')
    var list = data == null ? [] : (data instanceof Array ? data : [data]);

    $.each(list, function(index, company) {
        $('.companiesBody').append(
            '<div class="eventThumbnail thumbnail col-sm-3">'
            +  '<div class="jumbotron">'
            +     '<img src="" alt="Company Image">'
            + '</div>'
            +    '<div class="caption">'
            +       '<h3 class="h3-thumbnail-header" align="center">' + company.username + '</h3>'
            +       '<p class="p-thumbnail-description">' + company.description + '</p>'
            +       '<a href="' + ctxPath + "/users/COMPANY/"+ company.id + '" role="button" class="btn btn-primary center-block" id="company' + company.id + '">Show Company</a>'
            +       '<div class="input-group">'
            +           '<span class="input-group-addon">Website:</span>'
            +           '<input id="companyWebsite" type="text" class="form-control text-center"value="' + company.website + '" readonly>'
            +           '<span class="input-group-btn"><a href="#" class="btn btn-default" role="button">Go!</a></span>'
            +       '</div>'
            +   '</div>'
            + '</div>'
        );
    });
}

// Show a single activity
function initialiseActivity(id) {

    $.ajax({
        method: "GET",
        url: ctxPath + "/resources/activities/" + id,
        dataType: "json",
        success: function(data) {
            currentActivity = data;
            renderActivity(currentActivity);
        }
    })

}

function renderActivity(activity) {
    $('#activityName').text(activity.name);
    $('#activityName').append('<small>&ensp;' + activity.organiser.username + '</small>');
    $('#activityDescription').text(activity.description);
    $('#dateAndTime').append('<h3 class="text-center col-sm-6"> Date:&ensp;  ' + activity.startDate + '</h3>'
                            +'<h3 class="text-center col-sm-6"> Time:&ensp;  ' + activity.startTime + '</h3>');
    $('#eventWebsite').val(activity.website);
    $('#ticketPrice').val(activity.price);
    $('#activityAddress').append( '<dt>Street</dt><dd>'+ activity.address.street + '&nbsp;' + activity.address.number + '&nbsp;' + activity.address.addition + '</dd> '
                            +       '<dt>Zipcode</dt><dd>'+ activity.address.zipcode + '</dd> '
                            +       '<dt>City</dt><dd>'+ activity.address.city + '</dd> '
    );
    if (activity.organiser.role === 'COMPANY') {
        $('#activityOrganiserDetails').append(  '<dt>Company</dt><dd>'+ activity.organiser.username + '</dd> '
                                        +       '<dt>Contact</dt><dd>'+ activity.organiser.firstname + '</dd>'
                                        +                       '<dd>'+ activity.organiser.lastname + '&nbsp;' + activity.organiser.insertion + '</dd> '
                                        +       '<dt>Phone</dt><dd>'+ activity.organiser.phone+ '</dd> '
                                        +       '<dt>Email</dt><dd>'+ activity.organiser.email+ '</dd> '
                                        +       '<dt>Website</dt><dd>'+ activity.organiser.website + '</dd> '
        );
    }
    else {
        $('#activityOrganiserDetails').append(  '<dt>Username</dt><dd>'+ activity.organiser.username + '</dd> '
                                        +       '<dt>Firstname</dt><dd>'+ activity.organiser.firstname + '</dd> '
                                        +       '<dt>Lastname</dt><dd>'+ activity.organiser.lastname + '&nbsp;' + activity.organiser.insertion + '</dd> '
                                        +       '<dt>Phone</dt><dd>'+ activity.organiser.phone + '</dd> '
                                        +       '<dt>Email</dt><dd>'+ activity.organiser.email + '</dd> '
        );
    }
}

// Register Activity
$(document).ready(function(){
    $('#registerActivityButton').click( function(){

        $.ajax({
            method: "POST",
            contentType: 'application/json',
            datatype: "json",
            url: ctxPath + "/resources/activities/register",
            data: JSON.stringify($('#activityRegisterForm').serializeObject()),
            success: function(response) {
                window.location.href = "http://localhost:8080/workshop3.rest/activities"

            }
        });
    });
});

// Modify Activity
$(document).ready(function(){
    $('#modifyActivityButton').click(function() {

        $.ajax({
            method: "PUT",
            contentType: "application/json",
            url: ctxPath + "/resources/activities/modify",
            data: JSON.stringify($('#activityModificationForm').serializeObject())
        });
    });
});

function initModifyActivity(id) {
    $.ajax({
        method: "GET",
        url: ctxPath + "/resources/activities/" + id,
        dataType: "json",
        success: function(data) {
            currentActivity = data;
            renderActivityForModificationPage(currentActivity);
        }
    })

}

function renderActivityForModificationPage(activity) {
    $('#name').val(activity.name);
    $('#description').val(activity.description);
    $('#website').val(activity.website);
    $('#startDate').val(activity.startDate);
    $('#endDate').val(activity.endDate);
    $('#startTime').val(activity.startTime);
    $('#price').val(activity.price);
    $('#ticketsAvailable').val(activity.ticketsAvailable);
    $('#geocomplete').val("" + activity.address.street + " " + activity.address.number + " " + activity.address.zipcode + " " + activity.address.city);
    $('#route').val(activity.address.street);
    $('#street_number').val(activity.address.number);
    $('#postal_code').val(activity.address.zipcode);
    $('#locality').val(activity.address.city);
}

function initUserPage(id) {
    $.ajax({
        method: "GET",
        url: ctxPath + "/resources/users/" + id,
        dataType: "json",
        success: function(data) {
            currentUser = data;
            renderUserForPage(currentUser);
        }
    })
}
function initCompanyPage(id) {
    $.ajax({
        method: "GET",
        url: ctxPath + "/resources/users/" + id,
        dataType: "json",
        success: function(data) {
            currentUser = data;
            renderCompanyForPage(currentUser);
        }
    })
}

function renderCompanyForPage(user) {
    $('#companyname').val(user.username);
    $('#firstname').val(user.firstname);
    $('#insertion').val(user.insertion);
    $('#lastname').val(user.lastname);
    $('#username').val(user.username);
    $('#phone').val(user.phone);
    $('#email').val(user.email);
    $('#description').val(user.description);
    $('#website').val(user.website);
    $('#route').val(user.address.street);
    $('#street_number').val(user.address.number);
    $('#postal_code').val(user.address.zipcode);
    $('#locality').val(user.address.city);
}

function renderUserForPage(user) {
    $('#firstname').val(user.firstname);
    $('#insertion').val(user.insertion);
    $('#lastname').val(user.lastname);
    $('#username').val(user.username);

    $('#phone').val(user.phone);
    $('#email').val(user.email);
    $('#route').val(user.address.street);
    $('#street_number').val(user.address.number);
    $('#postal_code').val(user.address.zipcode);
    $('#locality').val(user.address.city);
}

// Show activity DataTables
$(document).ready(function() {

    $('#activityTable').DataTable({

        "ajax" : {
            "url" : ctxPath + "/resources/activities",
            "dataSrc" : ""
        },
        "columns" : [
            {'data' : 'id'},
            {'data' : 'name'},
            {'data' : 'description'},
            {'data' : 'startDate'},
            {'data' : 'endDate'},
            {'data' : 'startTime'},
            {'data' : 'price'},
            {'data' : 'ticketsAvailable'},
            {'data' : 'address.id'},
            {'data' : 'organiser.id'},
        ]
    });
});
// <-- User Methods -->

// Find all users and display them in a jQuery Datatables
$(document).ready(function () {

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

// Register User
$(document).ready(function() {
    $('#userRegisterButton').on('click', function(){
        $.ajax({
            method: 'POST',
            contentType: 'application/json',
            url: ctxPath + "/resources/users/register",
            data: JSON.stringify($('#userRegistrationForm').serializeObject()),
            success: function(response) {
                window.location.href = "http://localhost:8080/workshop3.rest/login"
            }
        });
    });
});

//Register Company
$(document).ready(function() {
    $('#companyRegistrationButton').on('click',function() {
        $.ajax({
            method: "POST",
            contentType: "application/json",
            url: ctxPath + "/resources/users/register/company",
            data: JSON.stringify($('#companyRegisterForm').serializeObject()),
            success: function(response) {
                window.location.href = "http://localhost:8080/workshop3.rest/companies"
            }
        });
    });
});

var ticketsOrdered;

// Bestelling
$(document).ready(function(){
    $('#ticketOrderButton').click(function() {
        console.log($('#ticketsOrdered').val());

        ticketsOrdered = $('#ticketsOrdered').val();
    });
});


function initOrderTable(id) {
    $.ajax({
        method: "GET",
        url: ctxPath + "/resources/activities/" + id,
        dataType: "json",
        success: function(data) {
            currentActivity = data;
            renderOrderTable(currentActivity);
        }
    });
};

function renderOrderTable(activity) {
    $('#orderTableBody').append(
         '<tr>'
       +     '<td>' + 1 + '</td>'
       +     '<td>' + activity.name + '</td>'
       +     '<td>' + activity.startDate + '</td>'
       +     '<td>' + activity.startTime + '</td>'
       +     '<td>' + activity.price + '</td>'
       +     '<td>' + ticketsOrdered + '</td>'
       + '</tr>'
    )
}

// Helper functie om form velden om te zetten in JSON
$.fn.serializeObject = function(){
    var o = {};
    var a = this.serializeArray();
    $.each(a, function(){
        if(typeof o[this.name] !== "undefined") {
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

// Geocomplete
$(document).ready(function() {

    $("#geocomplete").geocomplete({
        details: ".addressDetails",
        map: ".googleMap"
    });


    $("#findAddress").click(function(){
        $("#geocomplete").trigger("geocode");
    });
})
