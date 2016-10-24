/**
 * Created by douwejongeneel on 04/10/2016.
 */


var ctxPath = "http://localhost:8080/workshop3.rest";

var currentActivity;

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

    $('.agendaBody li').remove();
    $.each(list, function(index, activity) {
        $('.agendaBody').append(
            '<div class="eventThumbnail thumbnail col-sm-3">'
            +  '<div class="jumbotron">'
            +     '<img src="' + activity.image + '" alt="Event Image">'
            + '</div>'
            +    '<div class="caption">'
            +       '<h3 align="center">' + activity.name + '</h3>'
            +       '<p class="p-thumbnail-description">' + activity.description + '</p>'
            +       '<label for="btn-group">View: &ensp;</label>'
            +       '<div class="btn-group" role="group" aria-label="...">'
            +           '<a href="' + ctxPath + "/activities/activity/" + activity.id + '" role="button" class="btn btn-primary" id="activity' + activity.id +'">Activity</a>'
            +           '<a href="' + ctxPath + "/organisers/" + activity.organiser.id + '" role="button" class="btn btn-default" id="organiser' + activity.organiser.id + '">Organiser</a>'
            +           '<a href="' + ctxPath + "/addresses/" + activity.address.id + '" role="button" class="btn btn-primary" id="address' + activity.id + '">Address</a>'
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
            data: JSON.stringify($('#activityRegisterForm').serializeObject())
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

// Register
$(document).ready(function() {
    $('#userRegisterButton').on("click", function(){
        $.ajax({
            method: 'POST',
            contentType: 'application/json',
            url: ctxPath + "/resources/users/register",
            datatype: "json",
            data: JSON.stringify($('#activityRegisterForm').serializeObject())
        });
    });
});

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
