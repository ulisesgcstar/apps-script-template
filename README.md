# Plantilla de Entorno Profesional Google Apps Script (TS + ESLint)

Esta plantilla proporciona un entorno de desarrollo reproducible con TypeScript y ESLint para trabajar con Google Apps Script localmente usando Clasp.

## Requisitos Previos (Para un nuevo ordenador)

1.  Tener instalado **WSL** (con Ubuntu).
2.  Tener instalado **VSCode** y la extensión **Remote - WSL**.
3.  Haber ejecutado **`clasp login`** al menos una vez en tu entorno WSL.

## Uso (Primer Inicio)

El proceso se inicia ejecutando el script de configuración:

1.  Clona este repositorio: `git clone [URL_DE_TU_REPOSITORIO]`
2.  Navega a la carpeta: `cd nombre-del-repositorio`
3.  **Ejecuta el script de automatización:** `./setup.sh`
    *(Este paso instala todas las dependencias, configura TypeScript, y conecta el proyecto con Google.)*

## Comandos Esenciales

| Comando | Descripción |
| :--- | :--- |
| `npm run build` | Compila el código de `src/CODE.ts` a JavaScript en la carpeta `dist/`. |
| `npm run push` | **(Principal)** Ejecuta la compilación (`build`) y luego sube el código compilado (`dist/`) a Google Apps Script. |
| `npm run lint` | Ejecuta ESLint para revisar la calidad y el estilo del código en `src/`. |
| `clasp pull` | Baja el código más reciente de Google (usar con precaución, puede sobrescribir cambios locales). |