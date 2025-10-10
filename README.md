# Book Stack

Aplicación móvil premium para la búsqueda y exploración de libros de tecnología (Prueba técnica)

### Configuración de variables de entorno

Por motivos de seguridad, las variables de entorno no se incluyen en el repositorio.
Se proporciona un archivo de plantilla llamado `.env.template`. Debes copiarlo y renombrarlo a `.env`:

Para configurarlas:

```bash
cp .env.template .env
```

Luego, completa los valores correspondientes dentro del archivo `.env`.

> **Nota:** En un entorno real, las variables sensibles nunca se exponen públicamente. En este caso, se incluye la variable de entorno de la API de _It book_ (`ITBOOK_API_URL`) para fines de desarrollo y evaluación técnica. Si fuera necesario, el valor correcto será suministrado junto con las instrucciones del proyecto.
