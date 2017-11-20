# -*- coding:utf-8 -*-
from django.db import models
from django.utils.encoding import python_2_unicode_compatible


@python_2_unicode_compatible
class Mvinfo(models.Model):
    id = models.IntegerField(primary_key=True,auto_created=True)
    title = models.CharField(max_length=300)
    url = models.CharField(max_length=350)
    uri = models.CharField(max_length=350)
    def __str__(self):
        return self.title

@python_2_unicode_compatible
class Mvtj(models.Model):
    id = models.IntegerField(primary_key=True)
    num =  models.IntegerField()
    last_ip = models.CharField(max_length=20)
    last_visit = models.DateTimeField()
    def __str__(self):
        return self.id

@python_2_unicode_compatible
class Usertj(models.Model):
    ip = models.CharField(primary_key=True,max_length=20)
    num =  models.IntegerField()
    last_visit = models.DateTimeField()
    def __str__(self):
        return self.ip

@python_2_unicode_compatible
class Tg(models.Model):
    id = models.CharField(max_length=36, primary_key=True)
    url = models.CharField(max_length=350)
    des = models.CharField(max_length=350)
    timeout = models.DateField()
    def __str__(self):
        return self.des

@python_2_unicode_compatible
class Config(models.Model):
    name = models.CharField(max_length=50, primary_key=True)
    value = models.CharField(max_length=200)
    des = models.CharField(max_length=350)
    def __str__(self):
        return self.name