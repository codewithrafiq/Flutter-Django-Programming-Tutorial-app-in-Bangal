from django.db import models
from django.contrib.auth.models import User


class Category(models.Model):
    title = models.CharField(max_length=150)

    def __str__(self):
        return self.title


class Post(models.Model):
    category = models.ForeignKey(Category, models.CASCADE)
    title = models.CharField(max_length=150)
    code = models.TextField(blank=True, null=True)
    content = models.TextField()
    date = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Comment(models.Model):
    user = models.ForeignKey(User, models.CASCADE)
    post = models.ForeignKey(Post, models.CASCADE)
    title = models.TextField()
    time = models.DateField(auto_now_add=True)

    def __str__(self):
        return self.title


class Reply(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    comment = models.ForeignKey(Comment, on_delete=models.CASCADE)
    title = models.TextField()
    time = models.DateField(auto_now_add=True)

    def __str__(self):
        return f"User={self.user.username}||comment={self.comment}"


class Like(models.Model):
    post = models.ForeignKey(Post, on_delete=models.CASCADE)
    user = models.ForeignKey(User, on_delete=models.CASCADE)
    like = models.BooleanField(default=False)

    def __str__(self):
        return f"Post={self.post.id}||User={self.user.username}||Like={self.like}"
