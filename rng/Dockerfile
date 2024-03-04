FROM python:alpine
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY rng.py /
CMD ["python", "rng.py"]
EXPOSE 80