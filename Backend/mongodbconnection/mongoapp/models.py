from django.db import models
import uuid
from djongo import models

'''class Person(models.Model):
    first_name = models.CharField(max_length=30)
    last_name = models.CharField(max_length=30)

class Musician(models.Model):
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    instrument = models.CharField(max_length=100)

class Album(models.Model):
    artist = models.ForeignKey(Musician, on_delete=models.CASCADE)
    name = models.CharField(max_length=100)
    release_date = models.DateField()
    num_stars = models.IntegerField()    '''

class Posts(models.Model):
    _id=models.ObjectIdField()
    clubid=models.CharField(max_length=20)
    name=models.TextField()
    seats=models.TextField()
    number=models.TextField()
    objects=models.DjongoManager()    