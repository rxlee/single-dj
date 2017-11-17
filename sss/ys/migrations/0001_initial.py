# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Mvinfo',
            fields=[
                ('id', models.CharField(max_length=36, serialize=False, primary_key=True)),
                ('title', models.CharField(max_length=300)),
                ('url', models.CharField(max_length=350)),
                ('uri', models.CharField(max_length=350)),
            ],
        ),
    ]
