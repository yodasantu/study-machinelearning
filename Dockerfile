
#FROM ubuntu:latest
#FROM python:3
FROM continuumio/anaconda3

RUN apt-get update --fix-missing && apt-get install -y build-essential


#add julia

#https://julialang.s3.amazonaws.com/bin/linux/x64/0.4/julia-0.4.6-linux-x86_64.tar.gz

RUN mkdir -p /opt/julia_0.4.6 && \
    curl -s -L https://julialang.s3.amazonaws.com/bin/linux/x64/0.4/julia-0.4.6-linux-x86_64.tar.gz | tar -C /opt/julia_0.4.6 -x -z --strip-components=1 -f -

RUN ln -fs /opt/julia_0.4.6 /opt/julia

RUN echo "PATH=\"$PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/opt/julia/bin\"" > /etc/environment && \
    echo "export PATH" >> /etc/environment && \
    echo "source /etc/environment" >> /root/.bashrc

RUN /opt/julia/bin/julia -e 'Pkg.add("IJulia")'


# Add Tini. Tini operates as a process subreaper for jupyter. This prevents
# kernel crashes.
#ENV TINI_VERSION v0.6.0
#ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /usr/bin/tini
#RUN chmod +x /usr/bin/tini


#add octave
#RUN add-apt-repository ppa:octave/stable
#RUN apt-get update
#RUN apt-get install octave

RUN apt-get install -y octave octave-dbg octave-control octave-image octave-io octave-optim octave-signal octave-statistics

RUN pip install octave_kernel && \
    python -m octave_kernel.install


#Run jupyter notebook --generate-config


EXPOSE 8888


ENTRYPOINT ["/usr/bin/tini", "--"]

CMD ["jupyter", "notebook", "--port=8888", "--no-browser", "--ip=0.0.0.0"]
#CMD [ "/bin/bash" ]
