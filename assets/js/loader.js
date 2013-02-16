$(document).ready(function(){
	$("#loginBut").click(function(){
		//$("#timesheet").load("timesheet.html");
		$('#timesheet').hide();
		$('#timesheet').load('timesheet.html', function() { $('#timesheet').fadeIn('normal'); });
	});
});