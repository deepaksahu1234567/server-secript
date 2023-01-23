# server-secript
# assignment-repo
for ubuntu or linux 
sudo apt install git 
 git init 
 git clone https://github.com/deepaksahu1234567/server-secript.git
 
 ##create user in AWS (IAM)
 your crdential put in code ec2 file 
 and run the script 
 
 ## install terraform 
 https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli
 
 
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
#output

![first region  Oregon us_east_1](https://user-images.githubusercontent.com/115246044/213848710-a9927ab1-b536-4910-9f41-b7fa07e14a5e.png)

![second region mumbai_1](https://user-images.githubusercontent.com/115246044/213860188-6c9cf500-1cd6-4ba4-9b53-bd37aa2fd97e.png)


#####VNET
 8.  let's check instance select any public or private  main region your N.virgina 
 9.  private_instances
 10.  network bar vpc VPC ID= vpc-090e3517b62e89225(myVPC).
 11.  subnet_id =subnet-0417ae20bc55da54d (dev-private-net-1)
 ##output
![public instance Vnet](https://user-images.githubusercontent.com/115246044/213849174-7dea0f4e-f69f-4b8a-bf6b-de21fe48792b.png)
![public instance Vnet](https://user-images.githubusercontent.com/115246044/213849182-aaddaa35-90af-4b6b-b97f-9fa1db7a59a7.png)


###virtual network 
private NAT output

![privte nat](https://user-images.githubusercontent.com/115246044/213859430-f66fa9e7-3984-49e6-8f5e-955ac1fb4925.png)
##VPC output
![VPC](https://user-images.githubusercontent.com/115246044/213859492-ac5032c5-5dce-4797-9e3b-5d2b7c39c1d2.png)
## routes output

![routes](https://user-images.githubusercontent.com/115246044/213859657-d508bb15-cacb-4cc4-96a1-62d8d745c89c.png)
#routes for private output

![routes for private](https://user-images.githubusercontent.com/115246044/213859804-0f2632b7-f0ca-42ae-8816-03a62fb19280.png)

#internet getway
![IG](https://user-images.githubusercontent.com/115246044/213859900-47f59153-d489-4a5f-a63f-f12d94a0b6de.png)

#NEtwork Accls output

![Network ACCLs](https://user-images.githubusercontent.com/115246044/213859957-da7182c6-ec78-42d0-9be8-47ff8773f137.png)

##NAT output
![NAT ](https://user-images.githubusercontent.com/115246044/213859998-dacaf69b-10ee-4494-bf4a-8fa4e9e4bfe5.png)



