import json
from django.shortcuts import render
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
from .models import UserProfile

def index(request):
    return render(request, 'index.html')

@csrf_exempt
def user_list_create(request):
    if request.method == 'GET':
        users = UserProfile.objects.all().order_by('-id')
        return JsonResponse([u.to_dict() for u in users], safe=False)

    elif request.method == 'POST':
        try:
            data = json.loads(request.body)
            user = UserProfile.objects.create(
                username=data['username'],
                email=data['email']
            )
            return JsonResponse({
                "message": "Thêm User thành công qua Django ORM!",
                "user": user.to_dict()
            }, status=201)
        except Exception as e:
            return JsonResponse({"error": str(e)}, status=400)