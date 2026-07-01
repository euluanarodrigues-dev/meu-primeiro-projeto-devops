# Projeto DevOps: Da Containerização Local à Nuvem AWS

Este projeto foi desenvolvido para consolidar conhecimentos práticos em engenharia DevOps, cobrindo o ciclo completo de empacotamento de uma aplicação web estática com Docker e o provisionamento da infraestrutura na nuvem através da Amazon Web Services (AWS).

## Proposta do Projeto
* Containerização: Empacotar um site institucional/portfólio utilizando o servidor web Nginx (versão Alpine).
* Infraestrutura como Serviço (IaaS): Provisionar uma máquina virtual segura (EC2) na AWS.
* Deploy: Conectar via terminal remoto para configurar o ambiente e rodar o container final em produção.

## Processo de Desenvolvimento e Uso de IA nos Códigos
Para guiar a execução deste projeto e compreender a fundo as ferramentas de infraestrutura, utilizei Inteligência Artificial como mentora técnica e instrutora em tempo real. A IA foi a responsável por auxiliar no passo a passo estrutural e na criação dos arquivos e comandos, explicando detalhadamente a função de cada parâmetro técnico utilizado. 

Essa dinâmica de aprendizado permitiu compreender o papel de cada tecnologia no ecossistema DevOps, facilitando a absorção de conceitos sobre:
* Criação de imagens otimizadas com Dockerfile e gerenciamento de contextos de build.
* Provisionamento de instâncias na nuvem, regras de grupos de segurança e gerenciamento de acessos.
* Protocolos de comunicação de rede e chaves criptográficas para conexões remotas seguras.

## Desafios Enfrentados e Soluções (Troubleshooting)
Durante o desenvolvimento, surgiram alguns problemas reais de configuração, permissões e redes. Com o apoio pedagógico da IA, os erros foram analisados, contextualizados e resolvidos conforme detalhado abaixo:

### 1. Omissão do Contexto no Build do Docker
* **Problema:** Ao rodar o comando `docker build -t meu-primeiro-app:v1` pela primeira vez, o terminal retornou um erro informando que faltavam argumentos.
* **Causa:** O caractere `.` (ponto) foi omitido no final do comando. Ele é obrigatório porque indica ao Docker o diretório do contexto atual.
* **Solução:** O comando foi corrigido com a orientação da IA para:
  ```bash
  docker build -t meu-primeiro-app:v1 .
