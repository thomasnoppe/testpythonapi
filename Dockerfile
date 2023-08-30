FROM registry.access.redhat.com/ubi8/python-39:latest
 
WORKDIR /deployment
 
COPY app.py /deployment
COPY templates/* /deployment/templates/
COPY requirements.txt /deployment
 
RUN pip3 install -r requirements.txt

ENV GUNICORN_CMD_ARGS="--bind=0.0.0.0:8080 --workers=2 --log-level=debug "
 
EXPOSE 8080
 
CMD ["gunicorn", "app:app"]