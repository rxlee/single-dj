# -*- coding:utf-8 -*-
import json
from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from django.core.paginator import Paginator
from datetime import date, datetime
from django.core import serializers
from django.http import HttpResponse
from ys.models import Mvinfo
from ys.models import Tg


def index(request):
    # al = Tg.objects.all();
    # s = ''
    # for a in al:
    #    s+=a.url
    #    s+=' --- '
    #    s+=str(a.timeout)
    #    s+='\n'
    return render(request, "home1.html")


@csrf_exempt
def ajaxdata(request):
    if request.method == "GET":
        return None
    all = request.POST.keys()[0]
    param = eval(str(all))
    name = ""
    curPage = 1
    pageSize = 8
    if (param.has_key("name")):
        name = param["name"]
    if(param.has_key("curPage")):
        curPage = param["curPage"]
    # if (param.has_key("pageSize")):
    #     pageSize = param["pageSize"]
    # name_dict = {"name": name, 'curPage': curPage, "pageSize": pageSize, "param": param}
    # name_dict = {"param":param}
    count = Mvinfo.objects.filter(title__contains=name).count();
    mall = Mvinfo.objects.filter(title__contains=name)
    res = mall[(curPage - 1) * pageSize:curPage * pageSize]
    lis = []
    for r in res:
        d = dict()
        d["title"]=r.title
        d["url"]=r.url
        d["uri"]=r.uri
        d["id"]=r.id
        d["ishot"]= 1 if r.id%3==0 else 0
        lis.append(d)
    dd = dict()
    dd["data"]=lis
    dd["count"]=count
    # json_data = serializers.serialize("json", json.dumps(dd))
    return HttpResponse(json.dumps(dd,encoding="utf-8"), content_type="application/json")
