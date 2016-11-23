# docker-logstash-aws-elasticsearch        

Docker image that has the [AWS ElasticSearch](https://github.com/awslabs/logstash-output-amazon_es) (amazon_es) output plugin pre-installed and ready to use in the `output` section of your Logstash configuration.

The image is exactly the same as the original Logstash image, with the only addition being the `amazon_es` plugin installed.

Configuration can be set using the `-e 'input {...} output { amazon_es {...} }'` or `-f configfile` options when running the image.

## Tags

The image is tagged following the structure of the base [`logstash`](https://hub.docker.com/_/logstash/) image. 

Note: The Logstash plugin API has changed in Logstash 5.0 and it is not currently possible to use the AWS ElasticSearch plugin with that version. For that reason, no version of the image is built for Logstash 5.0.

## Example usage with Docker Compose configuration

``` yaml       
version: '2'

services:
    logstash:
        image: davidmarquis/docker-logstash-aws-elasticsearch:1.5
        command: >
          -e '
          input {
            udp {
               port => 5000
               codec => json
            }
          }
          output {
               amazon_es {
                   hosts => ["CLUSER_HOST.us-east-1.es.amazonaws.com"]
                   region => "us-east-1"
                   index => "INDEX_NAME-%{+YYYY.MM.dd}"
               }
           }
          '
        ports:
          - "5000:5000/udp"
```
