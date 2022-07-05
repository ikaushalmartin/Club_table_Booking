from unicodedata import name
from bson import ObjectId
from django.http import HttpResponse, JsonResponse
from django.shortcuts import render

# Create your views here.
from mongoapp.models import Posts
from django.views.decorators.csrf import csrf_exempt

 
@csrf_exempt
def add_post(request):
    clubid=request.POST.get("clubid")
    name=request.POST.get("name") 
    seats=request.POST.get("seats") 
    number=request.POST.get("number") 

    post=Posts(clubid=clubid,name=name,seats=seats,number=number)
    post.save()
    return HttpResponse("Inserted")



def delete_post(request,id):
    post=Posts.objects.get(_id=ObjectId(id))
    post.delete()
    return HttpResponse("Post Deleted")




def read_post_all(request):
    posts=Posts.objects.all()
    stringval=""
    for post in posts:
         
        stringval += "  ID - " + str(post._id)+"\n" +"\t"+" Clubid - " + post.clubid+"\n"+"\t"+ " Name - " + post.name+"\n" +"\t"+" Seats - " + post.seats+"\n" +"\t" +" Contact - " + post.number+"\n"+"\n\n"
        
    return HttpResponse(stringval)     
    


'''def read_post(request,id):
    post=Posts.objects.get(_id=ObjectId(id))
    stringval="First Name : "+post.user_details['first_name']+" Last name : "+post.user_details['last_name']+" Post Title "+post.post_title+" Comment "+post.comment[0]
    return HttpResponse(stringval)

@csrf_exempt
def update_post(request,id):
    post=Posts.objects.get(_id=ObjectId(id))
    post.user_details['first_name']=request.POST.get('first_name')
    post.save()
    return HttpResponse("Post Updated")'''