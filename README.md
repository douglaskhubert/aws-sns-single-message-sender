# AWS SNS Single Message Sender

Send a single AWS SNS message

## Motivation

This project was made due to a need for sending one single SNS message from a CronJob inside a Kubernetes Cluster. So you can schedule CronJob runs with the image built from this project.

## How to use it
Create a file named "message" containing the message you want to send. For example:
```
{"field": "value"}
```
Create a file named "env" from env.dist and fill the environment variables:
```
AWS_KEY=my-aws-key
AWS_SECRET=my-super-secret
AWS_TOPIC_ARN=target-topic-arn
```
You can set the message through environment variable MESSAGE:
```
MESSAGE={"field": "value"}
```

If MESSAGE environment variable was unset, it will be sent the content inside the file "message"

### Running with docker
Building:
```
docker build -t <image_name> .
```

Then:
```
docker run --env-file env <image_name>
```

### Running with docker-compose

Run:
```
docker-compose up
```
