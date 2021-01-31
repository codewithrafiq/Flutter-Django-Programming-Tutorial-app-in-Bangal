from rest_framework.views import APIView
from rest_framework.response import Response
from .models import *
from .serializers import *
from rest_framework.permissions import IsAuthenticated
from rest_framework.authentication import TokenAuthentication


class PostView(APIView):
    permission_classes = [IsAuthenticated, ]
    authentication_classes = [TokenAuthentication, ]

    def get(self, request):
        query = Post.objects.all()
        serializer = PostSerializer(query, many=True)
        data = []
        for post in serializer.data:
            post_like = Like.objects.filter(
                post=post['id']).filter(like=True).count()
            mylike = Like.objects.filter(post=post['id']).filter(
                user=request.user).first()
            if mylike:
                post['like'] = mylike.like
            else:
                post['like'] = False
            post['totallike'] = post_like
            comment_query = Comment.objects.filter(post=post['id'])
            comment_serializer = CommentSerializer(comment_query, many=True)
            comment_data = []
            for comment in comment_serializer.data:
                reply_query = Reply.objects.filter(comment=comment['id'])
                reply_serializer = ReplySerializer(reply_query, many=True)
                comment['reply'] = reply_serializer.data
                comment_data.append(comment)
            post['comment'] = comment_data
            data.append(post)
        return Response(data)
