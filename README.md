Projeto DevOps: Da Containerização Local à Nuvem AWS
Este projeto foi desenvolvido para consolidar conhecimentos práticos em engenharia DevOps, cobrindo o ciclo completo de empacotamento de uma aplicação web estática com Docker e o provisionamento da infraestrutura na nuvem através da Amazon Web Services (AWS).

Proposta do Projeto
Containerização: Empacotar um site institucional/portfólio utilizando o servidor web Nginx (versão Alpine).

Infraestrutura como Serviço (IaaS): Provisionar uma máquina virtual segura (EC2) na AWS.

Deploy: Conectar via terminal remoto para configurar o ambiente e rodar o container final em produção.

Desafios Enfrentados e Soluções (Troubleshooting)
Durante o desenvolvimento, surgiram alguns problemas reais de configuração, permissões e redes. Abaixo estão listados os erros encontrados e como foram resolvidos:

1. Omissão do Contexto no Build do Docker
Problema: Ao rodar o comando docker build -t meu-primeiro-app:v1 pela primeira vez, o terminal retornou um erro informando que faltavam argumentos.

Causa: Esqueci de incluir o caractere . (ponto) no final do comando, que indica ao Docker o diretório do contexto atual.

Solução: O comando foi corrigido para docker build -t meu-primeiro-app:v1 ..

2. Extensão Oculta no Arquivo de Configuração
Problema: Mesmo com o comando de build corrigido, o Docker retornou o erro failed to solve: failed to read dockerfile: open Dockerfile: no such file or directory.

Causa: O Windows criou o arquivo com a extensão oculta .txt (ficando como Dockerfile.txt), o que impediu o Docker de localizá-lo pelo nome padrão.

Solução: Removi a extensão .txt pelo gerenciador de arquivos, deixando o nome apenas como Dockerfile. O build rodou com sucesso logo em seguida.

3. Restrição de Segurança na Chave SSH (.pem) no Windows
Problema: Ao tentar conectar na instância EC2 da AWS pelo Windows PowerShell, o acesso foi negado porque as permissões da chave privada estavam "muito abertas".

Causa: O SSH exige que o arquivo de chave .pem tenha permissões restritas apenas ao dono. O sistema de herança de permissões do Windows costuma entrar em conflito com essa regra do Linux.

Solução: Para resolver o problema de forma rápida no ambiente local, usei o parâmetro que desativa a checagem rígida temporariamente direto na linha de comando do SSH:
ssh -i minha-chave-aws.pem -o StrictHostKeyChecking=no ubuntu@<IP_PUBLICO>
