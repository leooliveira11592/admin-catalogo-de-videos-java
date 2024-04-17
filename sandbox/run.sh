# Criar as docker networks
echo 'Criar as docker networks'
docker network create adm_videos_services
docker network create elastic

# Criar as pastas com permissões
echo ''
echo 'Criar as pastas com permissões'
sudo sudo chown root app/filebeat/filebeat.docker.yml
sudo mkdir -m 777 .docker
sudo mkdir -m 777 .docker/es01
sudo mkdir -m 777 .docker/keycloak
sudo mkdir -m 777 .docker/filebeat

echo ''
echo 'Instalando as dependencias do servico'
docker-compose -f services/docker-compose.yml up -d

echo ''
echo 'Instalando as dependencias do elastic'
docker-compose -f elk/docker-compose.yml up -d

echo ''
echo 'execute "./gradlew bootRun" na raiz do projeto'
#echo 'Instalando as dependencias do app'
#docker-compose -f app/docker-compose.yml up -d

echo ''
echo "Inicializando os containers..."
sleep 20