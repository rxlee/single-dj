from django.contrib import admin
from ys.models import Mvinfo
from ys.models import Tg
from models import Mvtj
from models import Usertj
from models import Config

class MvinfoAdmin(admin.ModelAdmin):
    list_display = ("id","title","url")
    search_fields = ('title', )
admin.site.register(Mvinfo,MvinfoAdmin,)

class TgAdmin(admin.ModelAdmin):
    list_display = ("id","des","url")
    search_fields = ('des','url', )
admin.site.register(Tg,TgAdmin,)

class MvtjAdmin(admin.ModelAdmin):
    list_display = ("id","num","last_visit")
    search_fields = ('id','last_visit', )
admin.site.register(Mvtj,MvtjAdmin,)

class UsertjAdmin(admin.ModelAdmin):
    list_display = ("ip","num","last_visit")
    search_fields = ('ip','last_visit', )
admin.site.register(Usertj,UsertjAdmin,)


class ConfigAdmin(admin.ModelAdmin):
    list_display = ("name","value","des")
    def get_readonly_fields(self, request, obj=None):
        return ["name"]
admin.site.register(Config,ConfigAdmin,)