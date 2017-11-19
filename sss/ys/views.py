# -*- coding:utf-8 -*-
import json
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import datetime
from django.http import HttpResponse
from models import Mvinfo
from models import Tg
import random


def index(request):
    return render(request, "home.html")


@csrf_exempt
def ajaxdata(request):
    if request.method == "GET":
        return None
    now = datetime.datetime.now()
    if now.hour>5 and now.hour<18:
        l=[]
        d = dict()
        d["title"] = "维护中..."
        l.append(d)
        dd = dict()
        dd["data"] = l
        dd["count"]=1
        return HttpResponse(json.dumps(dd, encoding="utf-8"), content_type="application/json")
    all = request.POST.keys()[0]
    param = eval(str(all))
    name = ""
    curPage = 1
    pageSize = 8
    if (param.has_key("name")):
        name = param["name"]
    if (param.has_key("curPage")):
        curPage = param["curPage"]
    # if (param.has_key("pageSize")):
    #     pageSize = param["pageSize"]
    # name_dict = {"name": name, 'curPage': curPage, "pageSize": pageSize, "param": param}
    # name_dict = {"param":param}
    a = Tg.objects.filter(timeout__gt=now)
    c = Tg.objects.filter(timeout__gt=now).count()
    count = Mvinfo.objects.filter(title__contains=name).count();
    mall = Mvinfo.objects.filter(title__contains=name)
    res = mall[(curPage - 1) * pageSize:curPage * pageSize]
    lis = []
    i = 0
    o = Tg()
    t = Tg()
    if c > 0:
        o = a[int(random.random() * c)]
        t = a[int(random.random() * c)]
    one = int(random.random() * pageSize)
    two = int(random.random() * pageSize)
    while one == two:
        two = int(random.random() * pageSize)
    for r in res:
        d = dict()
        d["title"] = r.title
        d["id"] = r.id
        if i == one:
            d["url"] = o.url
            d["id"] = -1
        elif i == two:
            d["url"] = t.url
            d["id"] = -1
        else:
            d["url"] = ""
        # d["uri"]=r.uri
        # d["id"]=r.id
        d["ishot"] = 1 if r.id % 4 == 0 or r.id % 7 == 0 else 0
        lis.append(d)
        i += 1
    dd = dict()
    dd["data"] = lis
    dd["count"] = count
    # json_data = serializers.serialize("json", json.dumps(dd))
    return HttpResponse(json.dumps(dd, encoding="utf-8"), content_type="application/json")

@csrf_exempt
def vidio(request):
    i=str(request.GET["v"]).split("%")[1]
    info = Mvinfo.objects.get(id=i)
    return render(request, "vidio.html",{"title":info.title,"url":info.url})