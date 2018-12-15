FROM ubuntu:18.04

RUN apt-get update && apt-get install -y --no-install-recommends locales wget gnupg2 ca-certificates
RUN wget https://packages.erlang-solutions.com/erlang-solutions_1.0_all.deb && dpkg -i erlang-solutions_1.0_all.deb && rm erlang-solutions_1.0_all.deb
RUN apt-get update && apt-get install -y nodejs npm esl-erlang elixir

RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
RUN mix local.hex --force && mix local.rebar --force