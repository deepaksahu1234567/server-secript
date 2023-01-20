provider "aws"{
   region ="ap-south-1"
   access_key="AKIA3S4U4GYX7HFKCY7P"
   secret_key="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"
}
resource "aws_instance" "terraform1"{

       ami          = "ami-0cca134ec43cf708f"
       instance_type= "t2.micro"
     
}
resource "aws_instance" "terraform2"{

       ami          = "ami-0cca134ec43cf708f"
       instance_type= "t2.micro"

}

provider "aws"{
   region ="us-west-2"
   access_key="AKIA3S4U4GYX7HFKCY7P"
   secret_key="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"
   alias = "west"
}
resource "aws_instance" "terraform3"{

       ami          = "ami-0ceecbb0f30a902a6"
       instance_type = "t2.micro"
        provider= "aws.west"
}


resource "aws_instance" "terraform4"{
       ami          = "ami-0ceecbb0f30a902a6"
       instance_type = "t2.micro"
        provider= "aws.west"
}

