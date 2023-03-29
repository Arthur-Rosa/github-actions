OLDIFS=$IFS
IFS=' '
array=($files)
IFS=$OLDIFS

cat ~/.aws/config

for f in "${array[@]}" 
do
    path="./$f"
    
    echo "##############################################################"
    echo "Conectando File"

    aws eks update-kubeconfig --name basic-cluster --region us-east-1

    echo "##############################################################"
    echo "Arquivo caller identity"

    aws sts get-caller-identity

    echo "##############################################################"
    echo "Pré criando File"

    echo "##############################################################"
    echo "Iniciando criação" 

    eksctl create nodegroup --config-file=$path

done