from django.template.loader import get_template
from django.template import Context
from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response

def index(request):
	#t = get_template('index.html')
	#html = t.render(Context())
	#return HttpResponse(html)
	return render_to_response('index.html')
	
def login(request):
	#t = get_template('login.html')
	#html = t.render(Context())
	#return HttpResponse(html)
	return render_to_response('login.html')
	
def submit(request):
	return render_to_response("This works")