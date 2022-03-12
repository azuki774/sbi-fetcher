FROM selenium/standalone-chrome:98.0
LABEL description="sbi-fetcher"
USER root
RUN apt-get update -y && apt-get install -y pip && pip3 install selenium && pip3 install bs4
COPY src/ /app
RUN mkdir /csv && chown seluser /csv
WORKDIR /app
ENTRYPOINT ["python3", "main.py"]
