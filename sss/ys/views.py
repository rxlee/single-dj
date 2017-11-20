# -*- coding:utf-8 -*-
import json
from django.shortcuts import render
from django.views.decorators.csrf import csrf_exempt
import datetime
from django.http import HttpResponse
from models import Mvinfo
from models import Tg
from models import Mvtj
from models import Usertj
from models import Config
import random
from django.http import Http404


def index(request):
    now = datetime.datetime.now()
    conf = Config.objects.get(name="maintenance")
    sta,end = conf.value.split("-")
    imgs = range(1,7)
    info = u"未满18岁禁止访问！请自行离开！！！"
    title = u"午夜xiong灵"
    if now.hour>int(sta) and now.hour<int(end):
        title = u"搬運工"
        imgs = ["a","b","c","d"]
        info = "Welcome to the site!!!"
    return render(request, "home.html",{"title":title,"imgs":imgs,"info":info})


@csrf_exempt
def ajaxdata(request):
    if request.method == "GET":
        return None
    now = datetime.datetime.now()
    conf = Config.objects.get(name="maintenance")
    sta,end = conf.value.split("-")
    maintenance= now.hour>int(sta) and now.hour<int(end)
        # l=[]
        # d = dict()
        # d["title"] = "维护中..."
        # l.append(d)
        # dd = dict()
        # dd["data"] = l
        # dd["count"]=1
        # return HttpResponse(json.dumps(dd, encoding="utf-8"), content_type="application/json")
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
    s = Tg()
    if c > 0:
        o = a[int(random.random() * c)]
        t = a[int(random.random() * c)]
        s = a[int(random.random() * c)]
    one = int(random.random() * pageSize)
    two = int(random.random() * pageSize)
    three = int(random.random() * pageSize)
    for r in res:
        d = dict()
        if maintenance: #维护中
            d["id"]=-1
            if i%3==1:
                d["title"] = o.des
                d["url"] = o.url
            elif i%3==2:
                d["title"] = t.des
                d["url"] = t.url
            else:
                d["title"] = s.des
                d["url"] = s.url
        else:
            d["title"] = r.title
            d["id"] = r.id
            if i == one:
                d["url"] = o.url
                d["id"] = -1
            elif i == two:
                d["url"] = t.url
                d["id"] = -1
            elif i==three:
                d["url"] = s.url
                d["id"] = -1
            else:
                d["url"] = ""
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
    now = datetime.datetime.now()
    conf = Config.objects.get(name="maintenance")
    sta,end = conf.value.split("-")
    if now.hour>int(sta) and now.hour<int(end):
        return HttpResponse("<h1>维护中...</h1>", content_type="text/html;charset=utf-8")
    i=str(request.GET["v"]).split("-")[1]
    info = Mvinfo.objects.get(id=i)
    now = datetime.datetime.now()
    iip="not get"
    if request.META.has_key('HTTP_X_FORWARDED_FOR'):
        iip = request.META['HTTP_X_FORWARDED_FOR']
    else:
        iip = request.META['REMOTE_ADDR']
    try:
        mtj = Mvtj.objects.get(id=i)
        mtj.num,mtj.last_visit,mtj.last_ip = mtj.num+1,now,iip
    except Mvtj.DoesNotExist:
        mtj = Mvtj(id=i,num=1,last_visit=now,last_ip=iip)
    mtj.save()
    try:
        utj = Usertj.objects.get(ip=iip)
        utj.num,utj.last_visit = utj.num+1,now
    except Usertj.DoesNotExist:
        utj=Usertj(ip=iip,num=1,last_visit=now)
    utj.save()
    return render(request, "vidio.html",{"title":info.title,"url":info.url})