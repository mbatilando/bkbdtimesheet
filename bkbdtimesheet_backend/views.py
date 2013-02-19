from django.template.loader import get_template
from django.template import Context
from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response
from django.core.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
import csv
import datetime

#e-mail stuff
import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email import Encoders
from email import Message
import os

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
	date = str(requestInput['weekof']).split('/')
	days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
	timeMap = ['8:00 AM', '8:30 AM', '9:00 AM', '9:30 AM', '10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM', '4:00 PM', '4:30 PM', '5:00 PM', '5:30 PM', '6:00 PM', '6:30 PM', '7:00 PM']
	lunchTimeMap = ['10:00 AM', '10:30 AM', '11:00 AM', '11:30 AM', '12:00 PM', '12:30 PM', '1:00 PM', '1:30 PM', '2:00 PM', '2:30 PM', '3:00 PM', '3:30 PM', '4:00 PM']
	
	with open('timesheet.csv', 'wb') as f:
		grandTotal = 0
		writer = csv.writer(f)
		writer.writerow(['Name:', str(requestInput['intern_name'])])
		writer.writerow(['Week of:', str(requestInput['weekof'])])
		writer.writerow(['Day', 'TimeIn', 'LunchIn', 'LunchOut', 'TimeOut', 'Total'])
		for i in range(0, len(days)):
			day = str(days[i])
			timeIn = float(requestInput[str(days[i])+'TimeIn'])
			lunchIn = float(requestInput[str(days[i])+'LunchIn'])
			lunchOut = float(requestInput[str(days[i])+'LunchOut'])			
			timeOut = float(requestInput[str(days[i])+'TimeOut'])
			timeTotal = timeOut - timeIn - (lunchOut - lunchIn)
			grandTotal += timeTotal
			
			timeIn = timeMap[int(timeIn*2)]
			lunchIn = lunchTimeMap[int(lunchIn*2)]
			lunchOut = lunchTimeMap[int(lunchOut*2)]
			timeOut = timeMap[int(timeOut*2)]
			
			writer.writerow([day, timeIn, lunchIn, lunchOut, timeOut, timeTotal])
		writer.writerow(['','','','','', grandTotal])
		
	#Send the result via e-mail
	employeeName = str(requestInput['intern_name']).split(" ")
	employeeName = employeeName[0].lower() + employeeName[1].lower()
	csvName = employeeName+"_timesheet_"+str(date[0])+"_"+str(date[1])+".csv"
	os.rename("timesheet.csv", csvName)
	mail("bkbdtimesheet@gmail.com", "Macklemore", manager, "timesheets " + str(requestInput['weekof']), "Total hours: " + str(grandTotal), csvName)
	os.rename(csvName, "timesheet.csv")
	
	return HttpResponse("Submitted, time to pop some tags")
	
@csrf_exempt
def mail(gmail_user, gmail_pwd, to, subject, text, attach):
   msg = MIMEMultipart()

   msg['From'] = gmail_user
   msg['To'] = to
   #msg['Cc'] = "Oscar.Bachtiar@blackbaud.com,Vinit.Nayak@blackbaud.com,Ashley.Gau@blackbaud.com,Christine.Loh@blackbaud.com,Mari.Batilando@blackbaud.com,bkbdtimesheet@gmail.com"
   msg['Subject'] = subject

   msg.add_header('Cc', 'Oscar.Bachtiar@blackbaud.com,Vinit.Nayak@blackbaud.com,Ashley.Gau@blackbaud.com,Christine.Loh@blackbaud.com,Mari.Batilando@blackbaud.com,bkbdtimesheet@gmail.com')
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