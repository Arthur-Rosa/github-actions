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

    aws eks update-kubeconfig --name $cluster --region $region

    aws eks list-clusters

    echo "##############################################################"
    echo "Arquivo caller identity"

    aws sts get-caller-identity

    echo "##############################################################"
    echo "Pré criando File"

    echo "##############################################################"
    echo "Iniciando criação" 

    eksctl create nodegroup --config-file=$path

done