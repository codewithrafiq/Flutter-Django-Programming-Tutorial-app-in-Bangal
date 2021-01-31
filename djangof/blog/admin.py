from django.contrib import admin
from .models import Category, Post, Comment, Reply, Like


admin.site.register([Category, Post, Comment, Reply, Like])
