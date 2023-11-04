FROM python:3.9

RUN apt-get update && apt-get upgrade -y && apt-get install -y vim curl git

RUN curl -fsSL https://code-server.dev/install.sh | sh
RUN code-server --install-extension ms-ceintl.vscode-language-pack-ja

RUN apt-get install -y nodejs npm && npm install n -g && n lts && apt-get purge -y nodejs npm

RUN mkdir -p /root/projects

EXPOSE 8080

ENTRYPOINT ["code-server", "--bind-addr"]
CMD ["0.0.0.0:8080"]
