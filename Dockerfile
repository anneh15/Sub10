# Usa la imagen base de Node.js
FROM node:18

# Establece el directorio de trabajo dentro del contenedor
WORKDIR /app

# Crea el archivo package.json con las dependencias necesarias
RUN echo '{ \
    "name": "supermercado", \
    "version": "1.0.0", \
    "description": "Aplicación de supermercado en Node.js", \
    "main": "index.js", \
    "scripts": { "start": "node index.js" }, \
    "author": "Estebano30", \
    "license": "ISC", \
    "dependencies": { "express": "^4.18.2" } \
  }' > package.json

# Instala las dependencias
RUN npm install

# Crea el archivo index.js directamente en el contenedor
RUN echo 'const express = require("express"); \
  const app = express(); \
  const PORT = 3000; \
  app.get("/", (req, res) => { \
    res.send("¡Hola, mundo!"); \
  }); \
  app.listen(PORT, () => { \
    console.log(`Servidor en funcionamiento en http://localhost:${PORT}`); \
  });' > index.js

# Expone el puerto de la aplicación
EXPOSE 3000

# Comando para iniciar la aplicación
CMD ["npm", "start"]
