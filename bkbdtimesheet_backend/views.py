from django.template.loader import get_template
from django.template import Context
from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response
from django.core.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
import csv
import datetime
import json
import sys
import re

#e-mail stuff
import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email import Encoders
from email import Message
import os
from datetime import timedelta, date

#Authentication stuff
from django.contrib import auth

@csrf_exempt
def index(request):
	#t = get_template('index.html')
	#html = t.render(Context())
	#return HttpResponse(html)
	print "WELCOME"
	return render_to_response('index.html')


@csrf_exempt	
def login(request):
	
	callback = request.GET.get('callback', '')	
	req = {}
	req['result'] = 0
	#response = json.dumps(req)
	#response = callback + '(' + response + ');'
	
	username = request.GET.get('username', '')
	password = request.GET.get('password', '')
	#print usernameInput
	#print passwordInput
	user = auth.authenticate(username=username, password=password)
	if user is not None and user.is_active:
		auth.login(request, user)
		req['result'] = 1
		print "EPIC WIIIN"
		#print "Woo-hoo"
		# Correct password, and the user is marked "active"
		#auth.login(request, user)
		# Redirect to a success page. OR send a response that says successful authentication
		# return HttpResponseRedirect("/account/loggedin/")
		#print "YEEE"
		#return HttpResponse(response, mimetype="application/json")
	else:
		req['result'] = -1
		print "EPIC FAAILL"
		#print "NAAAW"
		# Show error page OR send a response that says failed authentication
		# return HttpResponseRedirect("/account/invalid/")
		#print "FAAIILL"
		#return HttpResponse(response, mimetype="application/json")
	response = json.dumps(req)
	response = callback + '(' + response + ');'
	return HttpResponse(response, mimetype="application/json")
		
@csrf_exempt
def logout(request):
	auth.logout(request)
	# Redirect to success page OR successful logout page
	# return HttpResponseRedirect("/account/loggedout/")
	return HttpResponse("SUCCESS!")



@csrf_exempt	
def submit(request):

        requestInput = request.GET
        print(requestInput)

	callback = request.GET.get('callback', '')	
	req = {}
	response = json.dumps(req)
	response = callback + '(' + response + ');'
	return HttpResponse(response, mimetype="application/json")

	"""
	#requestInput = request.POST
	requestInput = request.GET
	date = str(requestInput['weekof']).split('/')
	fridayDate = datetime.date(date[2], date[1], date[0])
	oneDay = timedelta(days=1)
	
	days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday']
	timeMap = ['8:00 AM', '8:30 AM', '9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM', '4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM', '7:00 PM']
	lunchTimeMap = ['10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM', '4:00 PM']
	manager = str(requestInput['manager'])
	cc= str(requestInput['cc'])
	
	with open('timesheet.csv', 'wb') as f:
		weeklyHours = 0
		writer = csv.writer(f)
		writer.writerow(['Employee Time Sheet'])
		writer.writerow(['Employee Name:', str(requestInput['intern_name'])])
		writer.writerow(['Department:', 'Quality Assurance'])
		writer.writerow(['Week of:', str(requestInput['weekof'])])
		writer.writerow(['Weekday', 'Date', 'Start Work', 'Time Out (Lunch)', 'Time in (Lunch)', 'End Work', 'Total Hours', 'Weekly Hours'])
		for i in range(0, len(days)):
			day = str(days[i])
			curDate = fridayDate - (4 - i)*oneDay
			curDate = curDate.strftime("%m/%d/%y")
			timeIn = float(requestInput[str(days[i])+'TimeIn'])
			lunchIn = float(requestInput[str(days[i])+'LunchIn'])
			lunchOut = float(requestInput[str(days[i])+'LunchOut'])			
			timeOut = float(requestInput[str(days[i])+'TimeOut'])
			totalHours = timeOut - timeIn - (lunchOut - lunchIn)
			weeklyHours += timeTotal
			
			timeIn = timeMap[int(timeIn*2)]
			timeOut = timeMap[int(timeOut*2)]

			if (int(lunchIn) > 0) and (int(lunchOut) > 0):
				lunchIn = timeMap[int(lunchIn*2)]
				lunchOut = timeMap[int(lunchOut*2)]
			else:
				lunchIn = 'No lunch'
				lunchOut = 'No lunch'
			
			writer.writerow([day, curDate, timeIn, lunchIn, lunchOut, timeOut, totalHours, weeklyHours])
		writer.writerow([''])
		writer.writerow(['Weekly Total'])
		writer.writerow(['Total hours:', weeklyHours])
		writer.writerow(['Regular hours:', weeklyHours])
		writer.writerow(['Overtime hours:', 0])
		
	#Send the result via e-mail
	employeeName = str(requestInput['intern_name']).split(" ")
	employeeName = employeeName[0].lower() + employeeName[1].lower()
	csvName = employeeName+"_timesheet_"+str(date[0])+"_"+str(date[1])+".csv"
	os.rename("timesheet.csv", csvName)
	mail("bkbdtimesheet@gmail.com", "Macklemore", manager, cc, "timesheets " + str(requestInput['weekof']), "Total hours: " + str(weeklyHours), csvName)
	os.rename(csvName, "timesheet.csv")
        """


	
@csrf_exempt
def mail(gmail_user, gmail_pwd, to, cc, subject, text, attach):
   msg = MIMEMultipart()

   msg['From'] = gmail_user
   msg['To'] = to
   #msg['Cc'] = "Oscar.Bachtiar@blackbaud.com,Vinit.Nayak@blackbaud.com,Ashley.Gau@blackbaud.com,Christine.Loh@blackbaud.com,Mari.Batilando@blackbaud.com,bkbdtimesheet@gmail.com"
   msg['Subject'] = subject
   
   msg.add_header('Cc', cc)
   #msg.add_header('Cc', 'Oscar.Bachtiar@blackbaud.com,Vinit.Nayak@blackbaud.com,Ashley.Gau@blackbaud.com,Christine.Loh@blackbaud.com,Mari.Batilando@blackbaud.com,bkbdtimesheet@gmail.com')
   #msg.add_header('To', 'Oscar.Bachtiar@blackbaud.com,bkbdtimesheet@gmail.com')
   msg.attach(MIMEText(text))

   part = MIMEBase('application', 'octet-stream')
   part.set_payload(open(attach, 'rb').read())
   Encoders.encode_base64(part)
   part.add_header('Content-Disposition',
           'attachment; filename="%s"' % os.path.basename(attach))
   msg.attach(part)

   mailServer = smtplib.SMTP("smtp.gmail.com", 587)
   mailServer.ehlo()
   mailServer.starttls()
   mailServer.ehlo()
   mailServer.login(gmail_user, gmail_pwd)
   mailServer.sendmail(gmail_user, msg.get_all('To') + msg.get_all('Cc'), msg.as_string())
   
   #Specifically for this app - Cc to bkbdtimesheet@gmail.com
   # Should be mailServer.quit(), but that crashes...
   mailServer.close()
   
