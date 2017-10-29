FROM ruby:2.4.2-slim
MAINTAINER Wing Cheng <wing.cheng@jumo.world>

LABEL Name=Offer-Service
LABEL Version=1.0.0

RUN DEBIAN_FRONTEND=noninteractive apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    nodejs \
    libmysqlclient-dev ruby-mysql \
  && apt-get clean

WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --jobs 20 --retry 5

COPY . ./
#RUN bundle exec rake assets:precompile --trace

#EXPOSE 3000

CMD ["ruby"]
