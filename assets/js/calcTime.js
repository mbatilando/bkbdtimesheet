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
		var workTime = document.getElementById(timeOut).value - document.getElementById(timeIn).value;
		var lunchTime = document.getElementById(lunchOut).value - document.getElementById(lunchIn).value;
		if (workTime < 0 || lunchTime<0 || workTime-lunchTime < 0) {
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