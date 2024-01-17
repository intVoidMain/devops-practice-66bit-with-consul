FROM nginx:latest

RUN apt-get update && \
    apt-get install -y \
    unzip \
    wget && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://releases.hashicorp.com/consul-template/0.30.0/consul-template_0.30.0_linux_amd64.zip -o /opt/consul-template.zip && \
    unzip /opt/consul-template.zip -d /usr/local/bin/ && \
    rm /opt/consul-template.zip && \
    consul-template --version

COPY ./entrypoint.sh /home/entrypoint.sh
RUN chmod +x /home/entrypoint.sh

CMD ["/home/entrypoint.sh"]
