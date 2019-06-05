#!/bin/sh
aws configure set region us-east-1
aws configure set aws_access_key_id "${AWS_KEY}"
aws configure set aws_secret_access_key "${AWS_SECRET}"
