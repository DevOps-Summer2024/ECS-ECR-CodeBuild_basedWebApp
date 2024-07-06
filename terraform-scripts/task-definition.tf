data "aws_ecs_task_definition" "backend_td" {
  task_definition = "${aws_ecs_task_definition.backend_td.family}"
}

data "aws_ecs_task_definition" "frontend_td" {
  task_definition = "${aws_ecs_task_definition.frontend_td.family}"
}

resource "aws_ecs_task_definition" "backend_td" {
    family                = "backend"
    container_definitions = <<DEFINITION
[
  {
    "name": "backend",
    "image": "112764516604.dkr.ecr.us-east-1.amazonaws.com/twtr-be:dev",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 5000,
        "hostPort": 0
      }
    ],
    "memory": 300,
    "cpu": 10
  }
]
DEFINITION
}

resource "aws_ecs_task_definition" "frontend_td" {
    family                = "frontend"
    container_definitions = <<DEFINITION
[
  {
    "name": "frontend",
    "image": "112764516604.dkr.ecr.us-east-1.amazonaws.com/twtr-fe:dev",
    "essential": true,
    "portMappings": [
      {
        "containerPort": 80,
        "hostPort": 0
      }
    ],
    "memory": 300,
    "cpu": 10
  }
]
DEFINITION
}
