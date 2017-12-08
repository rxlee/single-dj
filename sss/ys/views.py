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
import redis
import random
from django.http import Http404
import time


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
    # a = Tg.objects.filter(timeout__gt=now)
    # c = Tg.objects.filter(timeout__gt=now).count()
    tt = []
    pool = redis.Redis(host='127.0.0.1',port=6379,db=0)
    if pool.get("tginfo")==None:
        a = Tg.objects.filter(timeout__gt=now)
        for r in a:
            di = dict()
            di["url"]=r.url
            di["desc"]=r.desc
            tt.append(di)
        pool.set("tginfo",json.dumps(tt))
    else:
        tt = json.loads(pool.get("tginfo"))
    c = len(tt)
    l=[]
    if pool.get("mvinfo")==None:
        all = Mvinfo.objects.filter(title__contains=name)
        for r in all:
            di = dict()
            di["title"] = r.title
            di["id"] = r.id
            di["url"] = r.url
            di["ishot"] = 1 if r.id % 4 == 0 or r.id % 7 == 0 else 0
            l.append(di)
        pool.set("mvinfo",json.dumps(l))
    else:
        l=json.loads(pool.get("mvinfo"))
    count = len(l)
    # mall = Mvinfo.objects.filter(title__contains=name)
    # res = mall[(curPage - 1) * pageSize:curPage * pageSize]
    res = l[(curPage - 1) * pageSize:curPage * pageSize]
    lis = []
    i = 0
    o = res[0]
    t = res[0]
    s = res[0]
    if c > 0:
        o = tt[int(random.random() * c)]
        t = tt[int(random.random() * c)]
        s = tt[int(random.random() * c)]
    one = int(random.random() * pageSize)
    two = int(random.random() * pageSize)
    three = int(random.random() * pageSize)
    for r in res:
        d = dict()
        if maintenance: #维护中
            d["id"]=-1
            if i%3==1:
                d["title"] = o["desc"]
                d["url"] = o["url"]
            elif i%3==2:
                d["title"] = t["desc"]
                d["url"] = t["url"]
            else:
                d["title"] = s["desc"]
                d["url"] = s["url"]
        else:
            d["title"] = r["title"]
            d["id"] = r["id"]
            if i == one:
                d["url"] = o["url"]
                d["id"] = -1
            elif i == two:
                d["url"] = t["url"]
                d["id"] = -1
            elif i==three:
                d["url"] = s["url"]
                d["id"] = -1
            else:
                d["url"] = ""
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