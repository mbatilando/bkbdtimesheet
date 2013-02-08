new datepickr('datepick', {
		'dateFormat': 'm/d/y'
	});

	function scroll () {
		console.log("here");
		window.scrollTo(0, document.body.scrollHeight);
	}

	var myHash = new Object();
	myHash['Monday'];
	myHash['Tuesday'];
	myHash['Wednesday'];
	myHash['Thursday'];
	myHash['Friday'];
	myHash['Saturday'];
	myHash['Sunday'];

	function calcHour(day) {
		var timeOut = day.concat("TimeOut");
		var timeIn = day.concat("TimeIn");
		var lunchOut = day.concat("LunchOut");
		var lunchIn = day.concat("LunchIn");
		myHash[day] = (document.getElementById(timeOut).value - document.getElementById(timeIn).value) - (document.getElementById(lunchOut).value - document.getElementById(lunchIn).value);
	}
  
  function calcTotal() {
	var total = 0;
	for (var day in myHash) {
		if (myHash[day]) {
			total += myHash[day];
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