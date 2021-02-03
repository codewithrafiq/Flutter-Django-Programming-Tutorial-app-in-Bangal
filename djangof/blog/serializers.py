from rest_framework import serializers
from .models import *
from django.contrib.auth import get_user_model

User = get_user_model()


class UserSerializers(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('id', 'username', 'password', 'email',)
        extra_kwargs = {'password': {"write_only": True, 'required': True}}


class PostSerializer(serializers.ModelSerializer):
    class Meta:
        model = Post
        fields = "__all__"
        depth = 1


class CommentSerializer(serializers.ModelSerializer):
    class Meta:
        model = Comment
        fields = "__all__"
        # depth = 1

    def to_representation(self, instance):
        response = super().to_representation(instance)
        response['user'] = UserSerializers(instance.user).data
        return response


class ReplySerializer(serializers.ModelSerializer):
    class Meta:
        model = Reply
        fields = "__all__"
        # depth = 1

    def to_representation(self, instance):
        response = super().to_representation(instance)
        response['user'] = UserSerializers(instance.user).data
        return response


class CategorySerializer(serializers.ModelSerializer):
    class Meta:
        model = Category
        fields = "__all__"
