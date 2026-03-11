# IaC 인프라 자동화 프로젝트

Terraform과 Ansible을 활용하여 클라우드 인프라를 코드로 관리하는 개인 IaC 프로젝트입니다.
반복적인 인프라 구성 작업을 선언적 코드로 정의하고, 운영 일관성과 효율을 높이는 것을 목표로 합니다.

---

## 구성 항목

### Terraform — AWS 인프라 자동화

AWS 환경에서 Terraform을 활용해 인프라를 코드로 정의하고 배포한 PoC 프로젝트입니다.

**구성 내용**
- VPC, Subnet, Route Table, NAT Gateway, Security Group 등 네트워크 구성
- EC2 배포 (Launch Template, User Data 활용)
- Auto Scaling Group 및 스케일링 정책 정의
- Kubernetes 오토스케일링 환경 구성 및 부하테스트 검증

**사용 기술**
- Terraform, AWS(VPC / EC2 / ASG / EKS)

**배포 흐름**
```
terraform init → terraform plan → terraform apply
```

---

### Ansible — OS 취약점 점검 및 조치 자동화 (추가 예정)

실무에서 수백 대 서버의 OS 취약점 점검을 Ansible Playbook으로 자동화한 경험을 기반으로 구성 예정입니다.

- 서버 인벤토리 분류 및 SSH 키 인증 구성
- 취약점 점검 스크립트 실행 Playbook
- 취약점 조치 Playbook (ftp 계정 Shell 제한 등)

---

## 프로젝트 목적

수작업으로 반복하던 인프라 구성과 운영 작업을 코드로 정의하여,
일관성 있는 환경 재현과 휴먼 에러 최소화를 목표로 합니다.

실무에서 직접 적용한 자동화 경험을 개인 프로젝트로 재현하고 정리한 저장소입니다.

---

## Author

[github.com/evergreen1844](https://github.com/evergreen1844)
