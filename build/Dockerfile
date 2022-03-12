FROM python:3.8-slim-buster as runner
LABEL description="sbi-fetcher"
RUN apt-get update \
  && apt-get install -y python3-selenium wget gnupg \
  && wget https://dl.google.com/linux/linux_signing_key.pub \
  && apt-key add linux_signing_key.pub \
  && echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | tee /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update \
  && apt -f install -y \
  && apt-get install -y google-chrome-stable \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* \
  && pip3 install selenium \
  && pip3 install bs4 \
  && pip3 install webdriver-manager \
  && mkdir /csv
WORKDIR /app
COPY src/ /app
ENTRYPOINT ["python3", "main.py"]
