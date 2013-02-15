from django.template.loader import get_template
from django.template import Context
from django.http import HttpResponse, Http404
from django.shortcuts import render_to_response
from django.core.context_processors import csrf
from django.views.decorators.csrf import csrf_exempt

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
	return HttpResponse("This works")