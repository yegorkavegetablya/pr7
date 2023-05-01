FROM python:3.9

ADD requirements.txt requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
WORKDIR .

LABEL author="Калюжный Егор Евгеньевич"

ENV url="https://www.mirea.ru/upload/medialibrary/80f/MIREA_Gerb_Colour.png"
ENV path="./static"
CMD wget -P $path $url

EXPOSE 80

ENTRYPOINT ["python", "manage.py", "runserver"]

VOLUME ./static

USER root

ONBUILD echo "Сборка и запуск произведены. Автор: Калюжный Егор Евгеньевич"