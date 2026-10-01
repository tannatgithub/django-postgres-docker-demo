from django.urls import path
from .views import index, user_list_create

urlpatterns = [
    path('', index, name='index'),
    path('api/users/', user_list_create, name='user_list_create'),
]