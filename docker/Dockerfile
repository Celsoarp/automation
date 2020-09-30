FROM alpine:latest

RUN apk add --no-cache --update python3 ca-certificates openssh-client sshpass dumb-init su-exec py3-pip;\
    apk add --no-cache --update --virtual build-dependencies python3-dev build-base libffi-dev openssl-dev ;\
    pip3 install --no-cache --upgrade pip ;\
    pip3 install --no-cache --upgrade setuptools ansible jmespath;\
    apk del --no-cache --purge build-dependencies ;\
    rm -rf /var/cache/apk/* ;\
    rm -rf /root/.cache ;

WORKDIR /ansible
RUN mkdir /ansible/playbooks
RUN ln -s /root/.ansible/collections/ansible_collections/ibm/isam/playbooks /ansible/playbooks/ansible_collections

ENV ANSIBLE_ROLES_PATH /ansible/roles

ENV ANSIBLE_GATHERING smart
ENV ANSIBLE_RETRY_FILES_ENABLED false
ENV ANSIBLE_HOST_KEY_CHECKING false
ENV ANSIBLE_PYTHON_INTERPRETER /usr/bin/python3

RUN pip3 install ibmsecurity

RUN ansible-galaxy collection install ibm.isam

