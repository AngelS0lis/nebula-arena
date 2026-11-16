module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "nebula-${terraform.workspace}"
  cluster_version = "1.31"

  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  eks_managed_node_groups = {
    juego = {
      name           = "game-pool"
      instance_types = ["c7i.xlarge"]

      min_size     = 3
      max_size     = 20
      desired_size = var.nodos_juego

      labels = {
        rol = "juego"
      }
      tags = {
        "game-server" = "true"
      }
    }
  }

  tags = {
    Environment = terraform.workspace
  }
}

resource "aws_ecr_repository" "imagenes" {
  name                 = "nebula-server-tf"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}
