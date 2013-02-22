from django.conf.urls import patterns, include, url
from bkbdtimesheet_backend.views import index, login, submit
from django.views.generic.simple import redirect_to
from django.contrib.staticfiles.urls import staticfiles_urlpatterns
from django.conf import settings
import os

# Uncomment the next two lines to enable the admin:
# from django.contrib import admin
# admin.autodiscover()

urlpatterns = patterns('',
	('^$', index),
	(r'^index/$', index),
	(r'^login/$', login),
	(r'^submit/$', submit),
	(r'^(?P<path>.*js)$', 'django.views.static.serve', {'document_root': os.path.abspath(os.path.curdir).replace('\\','/')}),
	(r'^(?P<path>.*css)$', 'django.views.static.serve', {'document_root': os.path.abspath(os.path.curdir).replace('\\','/')}),
	(r'^(?P<path>.*png)$', 'django.views.static.serve', {'document_root': os.path.abspath(os.path.curdir).replace('\\','/')}),
	(r'^(?P<path>.*jpeg)$', 'django.views.static.serve', {'document_root': os.path.abspath(os.path.curdir).replace('\\','/')}),
	(r'^(?P<path>.*jpg)$', 'django.views.static.serve', {'document_root': os.path.abspath(os.path.curdir).replace('\\','/')}),
    # Examples:
    # url(r'^$', 'bkbdtimesheet_backend.views.home', name='home'),
    # url(r'^bkbdtimesheet_backend/', include('bkbdtimesheet_backend.foo.urls')),

    # Uncomment the admin/doc line below to enable admin documentation:
    # url(r'^admin/doc/', include('django.contrib.admindocs.urls')),

    # Uncomment the next line to enable the admin:
    # url(r'^admin/', include(admin.site.urls)),
)

#urlpatterns += staticfiles_urlpatterns()