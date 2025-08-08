terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 4.0"
    }
  }

  backend "gcs" {
    bucket = "samurai-og1"  # Replace with your bucket
    prefix = "terraform/state"
  }
}
