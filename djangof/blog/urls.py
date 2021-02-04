from django.urls import path
from .views import *

urlpatterns = [
    path('posts/', PostView.as_view()),
    path('categorys/', CategoryView.as_view()),
    path('addlike/', AddALike.as_view()),
    path('addcomment/', AddComment.as_view()),
    path('addreply/', AddReply.as_view()),
]
