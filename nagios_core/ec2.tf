resource "aws_instance" "instance" {
  ami               = data.aws_ami.centos.id
  instance_type     = var.instance_type
  key_name          = aws_key_pair.mykey.key_name
  vpc_security_group_ids = [aws_security_group.ssh.id,aws_security_group.web.id]

  provisioner "remote-exec" {
    connection {
      host          = self.public_ip
      type          = "ssh"
      user          = "centos"
      private_key   = file("~/.ssh/id_rsa")
      }
      inline = [
        "sudo setenforce 0",
        "sudo sed  -i 's/SELINUX=.*/SELINUX=disabled/g' /etc/selinux/config",
        "sudo yum install httpd php php-cli gcc glibc glibc-common gd gd-devel net-snmp openssl-devel wget unzip -y",
        "sudo useradd nagios",
        "sudo groupadd nagcmd",
        "sudo usermod -a -G nagcmd nagios",
        "sudo usermod -a -G nagcmd apache",
        "cd /tmp",
        "sudo wget https://assets.nagios.com/downloads/nagioscore/releases/nagios-4.1.1.tar.gz",
        "sudo wget http://www.nagios-plugins.org/download/nagios-plugins-2.1.1.tar.gz",
        "sudo tar zxf nagios-4.1.1.tar.gz",
        "sudo tar zxf nagios-plugins-2.1.1.tar.gz",
        "cd nagios-4.1.1",
        "sudo ./configure --with-command-group=nagcmd",
        "sudo make all",
        "sudo make install",
        "sudo make install-init",
        "sudo make install-config",
        "sudo make install-commandmode",
        "sudo make install-webconf",
        "sudo htpasswd -b -c /usr/local/nagios/etc/htpasswd.users nagiosadmin nagiospassword",
        "cd /tmp/nagios-plugins-2.1.1",
        "sudo ./configure --with-nagios-user=nagios --with-nagios-group=nagios --with-openssl",
        "sudo make all",
        "sudo make install",
        "sudo service httpd start",
        "sudo service nagios start",                   
        ]
      }
  provisioner "local-exec" {
    command = "echo ${aws_instance.instance.private_ip} >> /etc/ansible/nagios_hosts"
  }
  tags =  {
    Name                  = "nagios_demo"
  }                
}
