FROM python:alpine
COPY requirements.txt /tmp/
RUN pip install -r /tmp/requirements.txt
COPY worker.py /
CMD ["python", "worker.py"]
