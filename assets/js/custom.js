////////////////////////
//// LOGIN FUNCTIONS////
////////////////////////

var x = 'foo';
$(document).ready(function() {
	$('#main').fadeIn(600);
	});


function jsonLogin(url, username, password) {
	$.ajax({
		type: 'POST',
		url: url,
		crossDomain: true,
		data: {username: username, password: password},
		contentType: "application/json",
		dataType: "jsonp",
		success: function(data) {return successLogin();},
		error: function(err) { alert('error occurred on request');}
	});
}


function jsonSubmit(url) {
	myHash = {};
	days = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"];
	for (var i=0; i < days.length; i++){
		dayTimeIn = days[i].concat("TimeIn")
		var dayTimeIn = days[i].concat("TimeIn"); 
		myHash[dayTimeIn] = document.getElementsByName(dayTimeIn).val();
		var dayLunchIn = days[i].concat("LunchIn");
		myHash[dayLunchIn] = document.getElementsByName(dayLunchIn).val();
		var dayLunchOut = days[i].concat("LunchOut");
		myHash[dayLunchOut] = document.getElementsByName(dayLunchOut).val();
		var dayTimeOut = days[i].concat("TimeOut");
		myHash[dayTimeOut] = document.getElementsByName(dayTimeOut).val();
	}
	myHash["username"] = $('#login-username').val();
	myHash["password"] = $('#login-password').val();

	$.ajax({
		type: 'POST',
		url: url,
		crossDomain: true,
		data: myHash,
		contentType: "application/json",
		dataType: "jsonp",
		success: function(data) {return successLogin();},
		error: function(err) { alert('error occurred on request');}
	});
}

	
function successLogin() {
	$('#timesheet').hide().load('timesheet.html').fadeIn(600);
	$('#loginContainer').remove();
	$('#replace').hide().load('profile.html').fadeIn(600);
}

$("#loginBut").click(function(){
	username = $('#login-username').val();
	password = $('#login-password').val();
	url = "http://bkbdtimesheet-backend.herokuapp.com/login";
	jsonLogin(url, username, password);
	return false;
});


$("#submitBut2").click(function(){
	alert("hi");
	$("#content").fadeOut().hide().load('submit.html').fadeIn(600);
});




$('a.modalConfirm').click(function() {
    //split at the '_' and take the second offset
    $("#content").fadeOut().hide().load('submit.html').fadeIn(600);
});


function successSubmit() {
	$('#timesheet').hide().load('submit.html').fadeIn(600);
	$('#loginContainer').remove();
	$('#replace').hide().load('profile.html').fadeIn(600);
}

$("#submitBut").click(function(){
	jsonSubmit(myHash);
	return false;
});


$('form').submit(function() {
	if (document.getElementById('totWeek').textContent != 'Error' && document.getElementById('totWeek').textContent != '') {
		var currentForm = this;
		bootbox.confirm("Are you sure?", function(result) {
		if (result) {
			currentForm.submit();
			}
		});
	}
});


////////////////////////
// TIMESHEET FUNCTIONS//
////////////////////////
var myHash = new Object();
myHash['Monday'];
myHash['Tuesday'];
myHash['Wednesday'];
myHash['Thursday'];
myHash['Friday'];
myHash['Saturday'];
myHash['Sunday'];

function calcHour(day) {
	var timeOut = parseFloat(document.getElementById(day.concat("TimeOut")).value);
	var timeIn = parseFloat(document.getElementById(day.concat("TimeIn")).value);
	var lunchOut = parseFloat(document.getElementById(day.concat("LunchOut")).value);
	var lunchIn = parseFloat(document.getElementById(day.concat("LunchIn")).value);
	var workTime = parseFloat(timeOut - timeIn);
	var lunchTime = parseFloat(lunchOut - lunchIn);


	if (workTime < 0 || lunchTime < 0 || workTime-lunchTime < 0 || lunchOut > timeOut || (lunchTime > 0 && lunchOut > timeOut + 2 )) {
		myHash[day] = "Error";
	}
	else if (lunchIn<0 && lunchOut<0) { //No lunch is selected
		myHash[day] = workTime;		
	}	
	else if (lunchIn<0 || lunchOut<0) { //lunchIn or lunchOut is set to noLunch but not both
		myHash[day] = "Error";
	} 

	else {
		myHash[day] = workTime - lunchTime;
	}
}

function calcTotal() {
var total = 0;
for (var day in myHash) {
	if (typeof myHash[day] === "number") {
		total += myHash[day];
	}
	else {
	 total = "Error";
	 break;
	}
}
return total;
}

function updateHash(day) {
	var totDay = "tot".concat(day);
	calcHour(day);
	document.getElementById(totDay).value=myHash[day];
	document.getElementById('totWeek').value=calcTotal();
}

function checkSubmit() {
	document.getElementById('submitBut2').onclick = function() {
		alert('hi');
		alert(document.getElementById('totWeek').textContent);
		if (document.getElementById('totWeek').textContent != 'Error' && document.getElementById('totWeek').textContent != '') {
			$('#modal').show();
		}
	}
}