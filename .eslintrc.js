module.exports = {
  root: true,
  env: {
    es2021: true,
    // Configura el entorno de Google Apps Script.
    // Esto le indica a ESLint que reconozca variables globales
    // como SpreadsheetApp, Logger, etc.
    "google-apps-script": true 
  },
  extends: [
    "eslint:recommended",
    "plugin:@typescript-eslint/recommended",
  ],
  parser: "@typescript-eslint/parser",
  parserOptions: {
    ecmaVersion: "latest",
    sourceType: "module",
    project: "./tsconfig.json",
  },
  plugins: ["@typescript-eslint"], // Eliminamos el plugin que dio error
  rules: {
    // Reglas de calidad estándar de TypeScript
    "@typescript-eslint/no-unused-vars": "error", 
    "@typescript-eslint/explicit-module-boundary-types": "off" 
  },
  ignorePatterns: ["dist/**/*"], 
};