from django.conf.urls import include, url
from django.contrib import admin
from ys import views as ys_views

urlpatterns = [
    # Examples:
    # url(r'^$', 'sss.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),
    url(r'^$', ys_views.index),
    url(r'^8/$', ys_views.ajaxdata),
    url(r'^vidio/$', ys_views.vidio),
    url(r'^admin/', include(admin.site.urls)),
]
