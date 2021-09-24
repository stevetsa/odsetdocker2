#FROM python:3.7

# Install manually all the missing libraries
#RUN apt-get update
#RUN apt-get install -y gconf-service libasound2 libatk1.0-0 libcairo2 libcups2 libfontconfig1 libgdk-pixbuf2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libxss1 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils default-jdk

# Install Chrome
#RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
#RUN dpkg -i google-chrome-stable_current_amd64.deb; apt-get -fy install

FROM selenium/standalone-chrome

USER root
RUN apt-get update
RUN apt-get install -y pip

#install webdriver
RUN wget --no-check-certificate https://chromedriver.storage.googleapis.com/93.0.4577.63/chromedriver_linux64.zip -P /opt/google/chrome


# Install Python dependencies.
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

# Copy local code to the container image.
#WORKDIR /app
#COPY . .
#CMD gunicorn --bind :$PORT --workers 1 --threads 3 main:app --timeout 90
