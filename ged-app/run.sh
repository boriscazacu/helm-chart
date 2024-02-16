#helm repo add redis https://charts.gitlab.io

kubectl create secret docker-registry -n recette regcred --docker-server=gitlab.eukles.com:7344 --docker-username=gitlab+deploy-token-225 --docker-password=EMs8pQ7yLXitg61nQPAb

helm upgrade --install pvc-backup ged-app --create-namespace --namespace recette -f applications/pvc/backup-values.yaml
helm upgrade --install redis ged-app --create-namespace --namespace recette -f applications/redis/values.yaml
helm upgrade --install mysql ged-app --create-namespace --namespace recette -f applications/mysql/values.yaml
helm upgrade --install app-web ged-app --create-namespace --namespace recette -f applications/app-web/values.yaml
helm upgrade --install app-supervisor ged-app --create-namespace --namespace recette -f applications/app-supervisor/values.yaml
helm upgrade --install app-es ged-app --create-namespace --namespace recette -f applications/app-es/values.yaml
helm upgrade --install app-ocr ged-app --create-namespace --namespace recette -f applications/app-ocr/values.yaml
helm upgrade --install app-officeconverter ged-app --create-namespace --namespace recette -f applications/app-officeconverter/values.yaml
helm upgrade --install app-email2pdf ged-app --create-namespace --namespace recette -f applications/app-email2pdf/values.yaml
helm upgrade --install app-html2pdf ged-app --create-namespace --namespace recette -f applications/app-html2pdf/values.yaml
helm upgrade --install app-img2pdf ged-app --create-namespace --namespace recette -f applications/app-img2pdf/values.yaml
helm upgrade --install app-pdf ged-app --create-namespace --namespace recette -f applications/app-pdf/values.yaml
helm upgrade --install app-lad ged-app --create-namespace --namespace recette -f applications/app-lad/values.yaml
helm upgrade --install app-thumbs ged-app --create-namespace --namespace recette -f applications/app-thumbs/values.yaml
helm upgrade --install zabbix-agent ged-app --create-namespace --namespace recette -f applications/zabbix-agent/values.yaml
helm upgrade --install app-adminer ged-app --create-namespace --namespace recette -f applications/app-adminer/values.yaml

