FROM ubuntu:latest
RUN apt-get update
RUN apt-get -y install python3.6 python3-pip
# copy app files
WORKDIR /app
COPY . /app/
RUN pip3 install -r requirements.txt 
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate
EXPOSE 8000
# run server
CMD ["python3","manage.py","runserver","0.0.0.0:8000"]