FROM ruby:2.7
RUN apt-get update && apt-get install -y vim
WORKDIR /workarea
RUN mkdir -p /workarea/lib /workarea/bin
COPY ./latinirb.gemspec /workarea
COPY ./lib/ /workarea/lib
COPY ./bin/ /workarea/bin
RUN gem build
RUN gem install $(ls *.gem)
CMD "latinirb" 
