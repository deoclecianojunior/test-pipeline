<?php

$tagVersion = '1.0.4';

$dockerCompose = file_get_contents('docker-compose.yml.example');
$dockerCompose = str_replace('tag_version', $tagVersion, $dockerCompose);
file_put_contents('docker-compose.yml', $dockerCompose);

$dockerFile = file_get_contents('./.docker/php/Dockerfile.example');
$dockerFile = str_replace('tag_version', $tagVersion, $dockerFile);
file_put_contents('./.docker/php/Dockerfile', $dockerFile);

echo shell_exec('docker-compose build');

echo shell_exec("docker tag pipeline_php:{$tagVersion} 172.17.177.52:5000/pipeline_php:{$tagVersion}");

echo shell_exec("docker push 172.17.177.52:5000/pipeline_php:{$tagVersion}");