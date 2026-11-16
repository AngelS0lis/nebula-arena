variable "region" {
  description = "Región de AWS"
  type        = string
  default     = "us-east-1"
}

variable "nodos_juego" {
  description = "Nodos iniciales del pool de servidores de juego"
  type        = number
  default     = 3
}
