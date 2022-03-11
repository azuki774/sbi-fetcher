FROM selenium/standalone-chrome:98.0
LABEL description="sbi-fetcher"
RUN sudo apt-get update -y && sudo apt-get install -y pip && pip3 install selenium && pip3 install bs4
COPY src/ /app
RUN sudo mkdir /csv && sudo chown seluser /csv
WORKDIR /app
ENTRYPOINT ["python3", "main.py"]
