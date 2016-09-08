# study-machinelearning



docker run -i -t -p 8888:8888 continuumio/anaconda3 /bin/bash -c "/opt/conda/bin/conda install jupyter -y --quiet && mkdir /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"


docker build -t jupyter/yao -f Dockerfile .

docker run -i -t -p 8888:8888 jupyter/yao

docker run -d -p 8888:8888 jupyter/yao



docker run -it \
    -p 8888:8888 \
    --entrypoint="/bin/bash" \
    jupyter/yao


%pylab
%matplotlib


docker pull elasticsearch

docker pull elasticsearch:1.7.5

docker pull sequenceiq/hadoop-docker:2.7.1

docker pull sequenceiq/hadoop-docker


docker pull sequenceiq/spark:1.6.0

docker pull sequenceiq/spark




