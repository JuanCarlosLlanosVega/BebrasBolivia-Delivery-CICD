# README DELIVERY - BebrasBolivia CI/CD

## 1. Descripción del proyecto

Este repositorio corresponde a una versión de entrega automática del proyecto **BebrasBolivia-Gen**.
El objetivo principal fue implementar un flujo de **Integración Continua y Despliegue Continuo (CI/CD)** usando **GitHub Actions** y un **Self-hosted Runner** instalado localmente.

El proyecto fue trabajado en un nuevo repositorio llamado:

```text
BebrasBolivia-Delivery-CICD
```

Repositorio:

```text
JuanCarlosLlanosVega/BebrasBolivia-Delivery-CICD
```

---

## 2. Flujo de trabajo usado

El flujo de trabajo implementado fue el siguiente:

```text
develop → main → GitHub Actions CI → GitHub Actions CD → Self-hosted Runner → Despliegue local
```

La rama `develop` se utilizó para realizar cambios de desarrollo, como la creación de una interfaz visual referente a delivery.
Luego, esos cambios fueron integrados a la rama `main`, donde se activa automáticamente el pipeline de CI/CD.

---

## 3. Ramas utilizadas

Se trabajó con dos ramas principales:

```text
main
develop
```

### Rama develop

En esta rama se realizaron los cambios de desarrollo, por ejemplo:

```text
- Cambio visible en la página principal.
- Interfaz visual de Delivery CI/CD.
- Pruebas antes de pasar a main.
```

### Rama main

En esta rama se integraron los cambios finales.
Cada vez que se realiza un `push` o merge hacia `main`, se ejecutan los workflows de GitHub Actions.

---

## 4. Integración Continua - CI

El workflow de CI se encuentra en:

```text
.github/workflows/ci.yml
```

Este workflow realiza las siguientes tareas:

```text
1. Descarga el código fuente del repositorio.
2. Configura Node.js.
3. Instala dependencias.
4. Verifica el formato del código.
5. Ejecuta análisis estático con ESLint.
6. Ejecuta auditoría de seguridad.
7. Ejecuta las pruebas automatizadas.
8. Construye el proyecto.
```

Los comandos principales validados fueron:

```powershell
npm run format
npm run lint
npm run build
npm test
```

El workflow CI quedó funcionando correctamente en GitHub Actions con estado verde.

---

## 5. Despliegue Continuo - CD Localhost

El workflow de CD se encuentra en:

```text
.github/workflows/cd-local.yml
```

Este workflow se ejecuta después de que el CI termina correctamente.

El CD realiza las siguientes tareas:

```text
1. Descarga el código actualizado.
2. Configura Node.js.
3. Instala dependencias del proyecto.
4. Genera el cliente de Prisma.
5. Construye el proyecto.
6. Ejecuta el script local de despliegue.
```

El CD utiliza un **Self-hosted Runner** instalado en Windows, el cual recibe el trabajo desde GitHub Actions y ejecuta el despliegue local.

---

## 6. Self-hosted Runner

Se instaló un runner local en Windows dentro de:

```text
C:\actions-runner
```

El runner fue conectado al repositorio de GitHub y quedó escuchando trabajos con el mensaje:

```text
Listening for Jobs
```

Cuando GitHub Actions ejecuta el workflow de CD, el runner recibe el trabajo y muestra un resultado similar a:

```text
Running job: despliegue-local
Job despliegue-local completed with result: Succeeded
```

Esto confirma que el despliegue fue ejecutado desde la máquina local.

---

## 7. Script de despliegue local

El script de despliegue local se encuentra en:

```text
scripts/deploy-local.ps1
```

Este script genera una evidencia local del despliegue en la carpeta:

```text
C:\Bebras-Delivery-Deploy
```

Los archivos generados como evidencia son:

```text
deploy-local-log.txt
page-desplegada.tsx
```

El archivo principal de evidencia es:

```text
C:\Bebras-Delivery-Deploy\deploy-local-log.txt
```

Ejemplo de contenido generado:

```text
Despliegue local ejecutado correctamente.

Repositorio: JuanCarlosLlanosVega/BebrasBolivia-Delivery-CICD
Rama: main
Commit: <hash-del-commit>

Configuracion de base de datos:
DB_USER: dev_user
DB_NAME: bebras_bolivia
DB_PASSWORD recibido desde GitHub Secrets: Si

Resultado:
CI aprobado y CD ejecutado en el runner local de Windows.
El flujo queda preparado para una version posterior con PostgreSQL y Docker Compose.
```

---

## 8. GitHub Secrets

Se configuraron variables de entorno seguras en GitHub Secrets para representar la configuración de base de datos.

Ruta utilizada en GitHub:

```text
Settings → Secrets and variables → Actions → Repository secrets
```

Secrets creados:

```text
DB_USER
DB_PASSWORD
DB_NAME
```

Valores usados:

```text
DB_USER = dev_user
DB_PASSWORD = dev_password
DB_NAME = bebras_bolivia
```

Estos secrets permiten preparar el flujo para una versión posterior con PostgreSQL y Docker Compose, sin exponer credenciales dentro del código fuente.

---

## 9. Base de datos y Docker

La guía base de CI/CD propone una arquitectura con:

```text
- Aplicación Node.js
- Base de datos PostgreSQL
- Docker
- Docker Compose
- GitHub Secrets
- Script deploy.sh
```

En este proyecto se realizó una adaptación local usando:

```text
- Windows
- Localhost
- GitHub Actions
- Self-hosted Runner
- Script deploy-local.ps1
```

La lógica principal se mantiene:

```text
push a main → CI → CD → runner local → evidencia de despliegue
```

El flujo quedó preparado para una futura integración con Docker Compose y PostgreSQL.

---

## 10. Interfaz visual de Delivery

Se creó una página principal referente al proceso de delivery.

Archivo modificado:

```text
cliente/src/app/page.tsx
```

La interfaz muestra visualmente el flujo:

```text
develop → main → CI automático → CD Localhost
```

Para levantar la página web en localhost se utiliza:

```powershell
npm --prefix cliente run dev
```

Luego se abre en el navegador:

```text
http://localhost:3000
```

---

## 11. Validación final

La validación final realizada fue:

```text
1. Crear un cambio visible en develop.
2. Probar format, lint, build y test.
3. Subir cambios a develop.
4. Integrar develop hacia main.
5. Hacer push a main.
6. Verificar CI en verde.
7. Verificar CD Localhost en verde.
8. Confirmar ejecución del runner local.
9. Revisar evidencia en C:\Bebras-Delivery-Deploy.
10. Levantar la página web en http://localhost:3000.
```

---

## 12. Evidencias recomendadas

Para la presentación o defensa del trabajo se deben guardar capturas de:

```text
1. Repositorio GitHub.
2. Ramas main y develop.
3. Página web Delivery en localhost.
4. Workflow CI en verde.
5. Workflow CD Localhost en verde.
6. Self-hosted runner ejecutando el trabajo.
7. GitHub Secrets creados.
8. Archivo .github/workflows/ci.yml.
9. Archivo .github/workflows/cd-local.yml.
10. Archivo scripts/deploy-local.ps1.
11. Archivo C:\Bebras-Delivery-Deploy\deploy-local-log.txt.
```

---

## 13. Conclusión

Se logró implementar una experiencia completa de CI/CD para el proyecto BebrasBolivia-Gen.

El sistema permite que un cambio realizado en `develop` pueda ser integrado a `main`, activando automáticamente GitHub Actions.
Primero se ejecuta la fase de CI para validar el proyecto.
Luego, si todo está correcto, se ejecuta la fase de CD mediante un Self-hosted Runner instalado localmente.

Como resultado, el proyecto queda automatizado para validar y desplegar cambios de forma controlada, segura y verificable.
