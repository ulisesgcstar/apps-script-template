#!/bin/bash

echo "--- Ejecutando Configuración de Entorno Profesional de Apps Script ---"

# 1. Instalar dependencias de Node.js (incluye Clasp, TS, y ESLint)
echo "Instalando dependencias de npm (TS/ESLint)..."
npm install

# 2. Inicializar el proyecto con Clasp
echo ""
echo "INICIO: Configuracion de Clasp."
read -p "¿Cuál es el ID del Script de Apps Script para este proyecto? (Vacío para crear uno nuevo): " SCRIPT_ID

if [ -z "$SCRIPT_ID" ]
then
  # Crea un nuevo proyecto y genera el .clasp.json
  echo "Creando nuevo proyecto Apps Script en Google..."
  clasp create --title "Nuevo Proyecto TS-Template"
else
  # Clona un proyecto existente y genera el .clasp.json
  echo "Conectando con Script ID: $SCRIPT_ID"
  clasp clone $SCRIPT_ID
fi

# 3. ACTUALIZACIÓN CRUCIAL: Configurar Clasp para trabajar con TypeScript
echo "Configurando Clasp para que use la carpeta 'dist/'..."
# Lee el .clasp.json, cambia rootDir a dist, y guarda los cambios
sed -i 's/"rootDir": ".*"/"rootDir": "dist"/g' .clasp.json

# 4. Mover código JS clonado (si existe) a src/ y renombrarlo a .ts
if [ -f "Código.js" ]; then
  echo "Detectado código existente ('Código.js'). Moviendo y renombrando a src/Código.ts."
  mv Código.js src/Código.ts
  # Eliminar el CODE.ts de la plantilla que está en blanco para evitar duplicidad.
  rm -f src/CODE.ts
fi

# 5. Mover el archivo de manifiesto appsscript.json clonado a src/
if [ -f "appsscript.json" ]; then
  echo "Detectado manifiesto clonado ('appsscript.json'). Moviendo a src/."
  mv appsscript.json src/
fi


# 6. Compilar código TypeScript inicial
echo "Compilando código TypeScript inicial a JavaScript (dist/)..."
npm run build

echo "FIN: Configuración lista."
echo ""
echo "¡Plantilla de Apps Script configurada y lista! Usa 'npm run push' para subir código."