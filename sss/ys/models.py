from django.db import models

# Create your models here.
class Mvinfo(models.Model):
    id = models.IntegerField(primary_key=True,auto_created=True)
    title = models.CharField(max_length=300)
    url = models.CharField(max_length=350)
    uri = models.CharField(max_length=350)

class Tg(models.Model):
    id = models.CharField(max_length=36, primary_key=True)
    url = models.CharField(max_length=350)
    timeout = models.DateField()