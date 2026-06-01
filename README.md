# 🚀 Projeto DevOps: Da Containerização Local à Nuvem AWS

Este projeto foi desenvolvido para consolidar conhecimentos práticos em engenharia DevOps, cobrindo o ciclo completo de empacotamento de uma aplicação web estática utilizando **Docker** e o provisionamento de infraestrutura escalável na nuvem através da **Amazon Web Services (AWS)**.

---

## 🎯 Proposta do Projeto
* **Containerização**: Empacotar um site institucional/portfólio usando um servidor web leve (Nginx Alpine).
* **Infraestrutura como Serviço (IaaS)**: Provisionar uma máquina virtual segura na nuvem.
* **Deploy Automatizado**: Conectar via terminal remoto para instalar dependências e rodar o container final em ambiente de produção.

---

## 🛠️ Desafios Enfrentados e Soluções (Troubleshooting)

Durante o desenvolvimento do projeto, surgiram desafios reais de configuração, permissões e redes. Abaixo estão listados os problemas encontrados e como foram solucionados:

### 1. Omissão do Contexto no Build do Docker
* **Problema:** Ao tentar buildar a imagem local pela primeira vez com `docker build -t meu-primeiro-app:v1`, o terminal retornou um erro informando que o comando requeria um argumento extra.
* **Causa:** Faltou incluir o caractere `.` (ponto) no final do comando, que indica ao Docker o diretório do contexto atual.
* **Solução:** O comando foi corrigido para `docker build -t meu-primeiro-app:v1 .`.

### 2. Extensão Oculta no Arquivo de Configuração
* **Problema:** Mesmo com o comando de build corrigido, o Docker Engine retornou o erro `failed to solve: failed to read dockerfile: open Dockerfile: no such file or directory`.
* **Causa:** O Windows gerou o arquivo com a extensão oculta `.txt` (`Dockerfile.txt`), impedindo o Docker de localizá-lo pelo nome padrão.
* **Solução:** A extensão foi removida via prompt/gerenciador de arquivos, deixando o nome estritamente como `Dockerfile`. O build foi executado com sucesso logo em seguida.

### 3. Restrição de Segurança no Par de Chaves Criptográficas (.pem)
* **Problema:** Ao tentar efetuar a conexão SSH com a instância EC2 da AWS pelo Windows PowerShell, o sistema barrou o acesso alegando que as permissões da chave privada eram "muito abertas" ou houve conflito na identificação do usuário local do Windows.
* **Causa:** O Linux exige que o arquivo de chave privada `.pem` seja acessível única e exclusivamente pelo proprietário. O gerenciamento de permissões nativo de herança do Windows entrava em conflito com essa regra.
* **Solução:** Contornamos o bloqueio do ecossistema local injetando o parâmetro de desativação de checagem rígida temporária diretamente na linha de comando do SSH:
  ```powershell
  ssh -i minha-chave-aws.pem -o StrictHostKeyChecking=no ubuntu@<IP_PUBLICO>
