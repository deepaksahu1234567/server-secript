# server-secript
# assignment-repo
for ubuntu or linux 
sudo apt install git 
 git init 
 git clone https://github.com/deepaksahu1234567/server-secript.git
 
 
 ## install terraform 
 
1.sudo apt-get update && sudo apt-get install -y gnupg software-properties-common

2.wget -O- https://apt.releases.hashicorp.com/gpg | \
    gpg --dearmor | \
    sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
3.gpg --no-default-keyring \
    --keyring /usr/share/keyrings/hashicorp-archive-keyring.gpg \
    --fingerprint
4.echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] \
    https://apt.releases.hashicorp.com $(lsb_release -cs) main" | \
    sudo tee /etc/apt/sources.list.d/hashicorp.list
5.sudo apt update

 6.sudo apt-get install terraform
 
 ###start HCL script
 
 #########two different region linux server 
 1. terraform init 
 2. terraform plan 
 3. terrfaorm apply
 4.  check the  two different region instances mumbai ,oregon  check it instances 
 5.  instances click 
 6.  done 


#####VNET
 8.  let's check instance select any public or private  main region your N.virgina 
 9.  private_instances
 10.  network bar vpc VPC ID vpc-090e3517b62e89225(myVPC).
 11.  subnet_id =subnet-0417ae20bc55da54d (dev-private-net-1)
 12.  
 13.  
 14.  
 
