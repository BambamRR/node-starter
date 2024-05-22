@echo off

rem Verificando se o Node.js está instalado
node -v > nul 2>&1
if %ERRORLEVEL% NEQ 0 (
    echo Você precisa ter o Node.js instalado para usar este script.
    pause
    exit
)

rem Criando estrutura do projeto
mkdir projeto-node

rem Entrando na pasta do projeto
cd projeto-node

rem Criando pastas principais
mkdir src
cd src
mkdir controllers
mkdir services
mkdir middlewares
mkdir routes
mkdir config
mkdir database
mkdir utils
cd ..


rem Criando arquivos essenciais
echo node_modules > .gitignore
echo .env > .gitignore
echo .gitignore criado.
echo README.md > README.md
echo Arquivo README.md criado.
call npm init -y

rem Criando variáveis de ambiente
echo PORT=3000 > .env
echo .env criado

rem Script finalizado com sucesso (mantém o prompt aberto)
echo Projeto Node.js criado com sucesso!
echo Utilize o comando 'npm start' para iniciar o servidor, pressione um botão para instalar as dependencias.

:choice
echo Deseja criar controllers, services e routes de exemplo? (1/2): (Pressione 1 para Sim ou 2 para Nao)
set /p choose=
if /i "%choose%"=="1" goto create_examples
if /i "%choose%"=="2" goto skip_examples
goto choice

:create_examples

echo Criando controllers de exemplo...
cd src/controllers

echo const ExampleService = require("../services/ExampleService"); >> ExampleController.js
echo const exampleService = new ExampleService(); >> ExampleController.js
echo. >> ExampleController.js
echo class ExampleController { >> ExampleController.js
echo   static async example(req, res) { >> ExampleController.js
echo     try { >> ExampleController.js
echo       const example = await exampleService.example(); >> ExampleController.js
echo       res.status(200).send(example); >> ExampleController.js
echo     } catch (error) { >> ExampleController.js
echo       res.status(400).send({ message: error.message }); >> ExampleController.js
echo     } >> ExampleController.js
echo   } >> ExampleController.js
echo } >> ExampleController.js
echo. >> ExampleController.js
echo module.exports = ExampleController; >> ExampleController.js

echo Controllers de exemplo criados.
cd ..


echo Criando services de exemplo...
cd services


echo class ExampleService { >> ExampleService.js
echo   async example() { >> ExampleService.js
echo     try { >> ExampleService.js
echo       const example = ^` >> ExampleService.js
echo       ^<!DOCTYPE html^> >> ExampleService.js
echo       ^<html lang="pt-BR"^> >> ExampleService.js
echo       ^<head^> >> ExampleService.js
echo       ^<meta charset="UTF-8"^> >> ExampleService.js
echo       ^<meta name="viewport" content="width=device-width, initial-scale=1.0"^> >> ExampleService.js
echo       ^<title^>Exemplo de Conteúdo^</title^> >> ExampleService.js
echo       ^<style^> >> ExampleService.js
echo           body { >> ExampleService.js
echo               font-family: Arial, sans-serif; >> ExampleService.js
echo               margin: 0; >> ExampleService.js
echo               padding: 0; >> ExampleService.js
echo               display: flex; >> ExampleService.js
echo               justify-content: center; >> ExampleService.js
echo               align-items: center; >> ExampleService.js
echo               height: 100vh; >> ExampleService.js
echo               background-color: #f0f0f0; >> ExampleService.js
echo           } >> ExampleService.js
echo           .content { >> ExampleService.js
echo               text-align: center; >> ExampleService.js
echo           } >> ExampleService.js
echo       ^</style^> >> ExampleService.js
echo       ^</head^> >> ExampleService.js
echo       ^<body^> >> ExampleService.js
echo       ^<div class="content"^> >> ExampleService.js
echo           ^<h1^>Este é um exemplo de conteúdo trazido pelo service da aplicação^</h1^> >> ExampleService.js
echo       ^</div^> >> ExampleService.js
echo       ^</body^> >> ExampleService.js
echo       ^</html^> >> ExampleService.js
echo       ^`; >> ExampleService.js
echo       return example; >> ExampleService.js
echo     } catch (error) { >> ExampleService.js
echo       throw new Error("Aconteceu um erro durante seu acesso a este service"); >> ExampleService.js
echo     } >> ExampleService.js
echo   } >> ExampleService.js
echo } >> ExampleService.js

echo module.exports = ExampleService >> ExampleService.js

echo Services de exemplo criados.
cd ..

echo Criando routes de exemplo...
cd routes

echo const ExampleController = require('../controllers/ExampleController') >> exampleRoute.js
echo. >> exampleRoute.js
echo const router = require('express').Router() >> exampleRoute.js
echo. >> exampleRoute.js
echo router >> exampleRoute.js
echo       .get('/', ExampleController.example) >> exampleRoute.js
echo. >> exampleRoute.js
echo module.exports = router >> exampleRoute.js

echo Routes de exemplo criadas.
cd ../..

rem Criando arquivo app.js com rotas

echo const express = require('express'); >> app.js
echo const app = express(); >> app.js
echo require('dotenv').config(); >> app.js
echo const { PORT } = process.env ^|^| 3000; >> app.js
echo. >> app.js
echo const exampleRoute = require('./src/routes/exampleRoute.js') >> app.js
echo. >> app.js
echo. >> app.js
echo app.use('/', exampleRoute) >> app.js
echo. >> app.js
echo app.listen(PORT, () =^> { >> app.js
echo  console.log(`Servidor rodando na porta ${PORT}`); >> app.js
echo }); >> app.js
echo app.js criado com sucesso.


goto end

:skip_examples
echo Criação de controllers, services e routes de exemplo ignorada.

rem Criando arquivo app.js inicial
echo const express = require('express'); >> app.js
echo const app = express(); >> app.js
echo require('dotenv').config(); >> app.js
echo const { PORT } = process.env ^|^| 3000; >> app.js
echo. >> app.js

echo. >> app.js
echo. >> app.js

echo. >> app.js
echo app.listen(PORT, () =^> { >> app.js
echo  console.log(`Servidor rodando na porta ${PORT}`); >> app.js
echo }); >> app.js
echo app.js criado com sucesso.

goto end

:end

rem Instalando dependências básicas
echo Instalando dependencias...
call npm install express nodemon dotenv
echo.
echo Dependencias instaladas com sucesso.
echo.
echo Pressione qualquer tecla para sair.
echo %cd%
pause >nul
