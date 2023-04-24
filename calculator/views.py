from django.shortcuts import render
from django.http import HttpResponse


def display_page(request):
    return render(request, 'index.html')


def do_calculations(request):
    expression = request.GET.get('expression')

    clear_expression = ''
    for symbol in expression:
        if symbol in '1234567890+-*/()':
            clear_expression += symbol

    try:
        result = eval(clear_expression)
        return HttpResponse(content=result, status=200)
    except:
        return HttpResponse(content="ОШИБКА", status=200)
