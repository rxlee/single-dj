# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('ys', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='Tg',
            fields=[
                ('id', models.CharField(max_length=36, serialize=False, primary_key=True)),
                ('url', models.CharField(max_length=350)),
                ('timeout', models.DateField()),
            ],
        ),
    ]
