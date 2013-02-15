from django.template.loader import get_template
from django.template import Context
from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response
from django.core.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt
import csv

#e-mail stuff
import smtplib
from email.MIMEMultipart import MIMEMultipart
from email.MIMEBase import MIMEBase
from email.MIMEText import MIMEText
from email import Encoders
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
	days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
	
	with open('output.csv', 'wb') as f:
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
			writer.writerow([day, timeIn, lunchIn, lunchOut, timeOut, timeTotal])
		writer.writerow(['','','','','', grandTotal])
		
	#Send the result via e-mail
	mail("oscarbachtiar759@gmail.com", "Blitzshadow759", "oscarbachtiar759@gmail.com", "timesheets " + str(requestInput['weekof']), "Total hours: " + grandTotal, "output.csv")
		
	return HttpResponse("Submitted, time to pop some tags")
	
@csrf_exempt
def mail(gmail_user, gmail_pwd, to, subject, text, attach):
   msg = MIMEMultipart()

   msg['From'] = gmail_user
   msg['To'] = to
   msg['Subject'] = subject

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
   mailServer.sendmail(gmail_user, to, msg.as_string())
   # Should be mailServer.quit(), but that crashes...
   mailServer.close()