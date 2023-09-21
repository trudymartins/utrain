resource "aws_lightsail_instance" "gitlab_test" {
  name              = "custom_gitlab"
  availability_zone = "us-east-1a"
  blueprint_id      = "amazon_linux_2"
  bundle_id         = "nano_1_0"
  tags = {
    env = "dev"
  }
}
resource "aws_lightsail_instance" "example" {
  name              = "example-instance"
  availability_zone = "us-east-1a"  
  blueprint_id      = "centos_7"
  bundle_id         = "nano_2_0"

  user_data = <<-EOF
    #!/bin/bash
    sudo yum install htppd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "<h1>This sever is created using Terraform <h1>" | sudo tee /var/www/html/index.html"
    EOF
}

output "public_ip" {
  value = aws_lightsail_instance.example.public_ip_address
}










