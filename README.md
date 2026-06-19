# Terraform AWS Nginx

Provisionamento de infraestrutura AWS utilizando Terraform.

## Arquitetura

Internet
    |
    v
Security Group
    |
    v
EC2 (Amazon Linux 2023)
    |
    v
Nginx
    |
    v
Página Customizada

## Recursos Provisionados

- VPC
- Public Subnet
- Internet Gateway
- Route Table
- Security Group
- EC2
- Nginx
- S3 Backend
- DynamoDB Lock Table

## Tecnologias

- Terraform
- AWS EC2
- AWS VPC
- AWS S3
- AWS DynamoDB
- GitHub Actions

## Pipeline CI

- terraform fmt
- terraform validate
- terraform plan

## Estrutura

terraform-aws-nginx/
├── environments/
├── modules/
│   ├── vpc/
│   ├── security-group/
│   └── ec2/
└── .github/workflows/

## Como executar

terraform init
terraform plan
terraform apply

## Versionamento

v1.0.0 - VPC
v2.0.0 - Security Group
v3.0.0 - EC2 + Nginx

## Próximas evoluções

- ALB
- Auto Scaling Group
- HTTPS com ACM
- Route53
- GitHub Actions Apply