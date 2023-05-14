resource "aws_ecr_repository" "Attendance-manager" {
  name = "Attendance-manager"

  image_scanning_configuration {
    scan_on_push = true
  }
}
