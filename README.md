# Book Stack

**Book Stack** es una aplicación móvil desarrollada en Flutter que permite buscar, explorar y puntuar libros de tecnología utilizando la API pública de [It Book Store](https://api.itbook.store/).
Fue construida siguiendo principios de Clean Architecture y aplicando buenas prácticas de desarrollo Flutter.

## Tecnologías utilizadas

El proyecto hace uso de las siguientes librerías y herramientas principales:

- [SDK Flutter] versión 3.29.0.
- [Riverpod] versión 3.0.3. Gestión del estado reactivo y desacoplado, asegurando una arquitectura mantenible y escalable.
- [Dio] versión 5.9.0. Cliente HTTP para el consumo de la API.
- [Go Router] versión 16.2.4. Manejador de rutas.
- [Drift] versión 0.2.7. ORM local basado en SQLite para persistencia de datos (puntajes).

## Características principales

- 🔍 Búsqueda dinámica de libros por título.
- 📖 Visualización detallada de cada libro (autor, precio, descripción, ISBN, etc.).
- ⭐ Sistema de puntuación local para valorar libros.
- 💾 Persistencia local de los puntajes usando Drift.
- 🧭 Navegación fluida y organizada gracias a Go Router.
- ⚙️ Gestión de estado limpia y desacoplada con Riverpod.

## Configuración de variables de entorno

Por motivos de seguridad, las variables de entorno no se incluyen en el repositorio.
Se proporciona un archivo de plantilla llamado `.env.template`. Debes copiarlo y renombrarlo a `.env`:

Para configuración:

```bash
cp .env.template .env
```

Luego, completa los valores correspondientes dentro del archivo `.env`.

> **Nota:** En un entorno real, las variables sensibles nunca se exponen públicamente. En este caso, se incluye la variable de entorno de la API de _It book_ (`ITBOOK_API_URL`) para fines de desarrollo y evaluación técnica. Si fuera necesario, el valor correcto será suministrado junto con las instrucciones del proyecto.

## Instalación y ejecución

Sigue estos pasos para clonar y ejecutar el proyecto localmente:

1. Clona el repositorio desde GitHub:

   ```bash
   git clone https://github.com/julianocampovelez/book-stack.git
   ```

2. Ingresa al directorio del proyecto:

   ```bash
   cd book_stack
   ```

3. Instala las dependencias:
   El proyecto está estructurado en dos paquetes independientes:

   - `app` → contiene la aplicación.
   - `design_system` → incluye el sistema de diseño basado en Atomic Design.

   Debes instalar las dependencias en cada paquete por separado:

   ```bash
    # Instalar dependencias del paquete principal
    cd app
    flutter pub get

    # Volver al directorio raíz
    cd ..

    # Instalar dependencias del sistema de diseño
    cd design_system
    flutter pub get
   ```

4. Configura las variables de entorno (como se explicó arriba).

5. Ejecuta la aplicación: Se debeje ejecutar desde la raíz de la carpeta `app`.

   ```bash
   flutter run
   ```

## Arquitectura

El proyecto sigue una estructura modular inspirada en Clean Architecture, dividiendo las responsabilidades en capas:

```
app/
│
├── lib/        # Aplicación con lógica y componentes principales
│ ├── core/     # Configuraciones
│ ├── features/ # Funcionalidades
│ │        └── home
│ │              ├── domain         # Contratos de negociop
│ │              ├── infrastructure # Implementaciones
│ │              └── presentation   # UI
│ ├── book_stack_app.dart # Aplicación principal
│ └── main.dart

design_system/  # Atomic Design: átomos, moléculas y organismos reutilizables
```

## Descripción técnica general

Book Stack fue creada como una prueba técnica con enfoque en arquitectura limpia, modularidad y mantenibilidad.
Integra datos en tiempo real desde una API externa y sincroniza la información local de puntuación mediante Drift.

El uso de Riverpod garantiza una gestión de estado reactiva y predecible, mientras que Go Router facilita una navegación declarativa moderna.
En conjunto, estas tecnologías demuestran una implementación sólida y profesional de los fundamentos de Flutter.

## Autor

Julián Ocampo Vélez
