FROM python:2.7-alpine
RUN apk add --update curl
RUN pip install boto
RUN curl -L https://raw.githubusercontent.com/gianlucaborello/aws-ssh-config/master/aws-ssh-config.py > /bin/aws-ssh-config.py
RUN chmod a+x /bin/aws-ssh-config.py
RUN mkdir /root/.aws
LABEL io.whalebrew.name aws-ssh-config
LABEL io.whalebrew.config.environment '["AWS_PROFILE","AWS_ACCESS_KEY_ID", "AWS_SECRET_ACCESS_KEY", "AWS_REGION", "AWS_SECURITY_TOKEN"]'
ENTRYPOINT ["/bin/aws-ssh-config.py"]
