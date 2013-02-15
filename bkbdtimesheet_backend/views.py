from django.template.loader import get_template
from django.template import Context
from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response
from django.core.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
import csv

@csrf_exempt
def index(request):
	#t = get_template('index.html')
	#html = t.render(Context())
	#return HttpResponse(html)
	return render_to_response('index.html')

@csrf_exempt	
def login(request):
	#t = get_template('login.html')
	#html = t.render(Context())
	#return HttpResponse(html)
	return render_to_response('login.html')

@csrf_exempt	
def submit(request):
	requestInput = request.POST
	days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
	
	with open('output.csv', 'wb') as f:
		grandTotal = 0
		writer = csv.writer(f)
		writer.writerow(['Day', 'TimeIn', 'LunchIn', 'LunchOut', 'TimeOut', 'Total'])
		for i in range(0, len(days)):
			day = days[i]
			timeIn = requestInput[str(days[i])+'TimeIn']
			lunchIn = requestInput[str(days[i])+'LunchIn']
			lunchOut = requestInput[str(days[i])+'LunchOut']			
			timeOut = requestInput[str(days[i])+'TimeOut']
			timeTotal = timeOut - timeIn - (lunchOut - lunchIn)
			grandTotal += timeTotal
			writer.writerow([day, timeIn, lunchIn, lunchOut, timeOut, timeTotal])
		writer.writerow(['','','','','', grandTotal])
		
	return HttpResponse(open('output.csv'))