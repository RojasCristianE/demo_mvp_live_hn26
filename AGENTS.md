# 🧠 AGENTS.md — Experimento en Vivo: Demo MVP Autónoma (Hackathon Kronox 2026)

> **Repositorio del Experimento:** `10 Octubre/04_Proyectos/Charla_Hackathon_08-10-2026/Materiales/demo_mvp_live_hn26/`  
> **Conferencia:** Programación aumentada con Inteligencia Artificial: nuevas formas de desarrollar software  
> **Fecha:** Jueves, 08 de octubre de 2026 | 06:30 p.m. – 07:30 p.m.  
> **Espacio:** Centro de Convenciones Olof Palme — Sala 4 / Piso 1 (~70 participantes)  
> **Expositor:** Cristian Ezequiel Rojas Gutiérrez (Especialista de Formación Profesional — Mentor Técnico CI)  

---

## 🎯 Concepto y Dinámica del Experimento en Vivo

El experimento consiste en solicitar al público del Olof Palme una **idea de proyecto en tiempo real**, transformarla en una especificación técnica sintética y guiar al agente autónomo para construir un **MVP genuinamente funcional, estéticamente moderno, refinado y de alto impacto visual** frente a los espectadores, en una ventana de **40 ± 5 minutos** (con objetivo central en **40 minutos**).

El flujo de trabajo es **100% MONOAGENTE**: el agente asume de forma directa, continua y secuencial la totalidad de las etapas (razonamiento arquitectónico, scaffolding visual, diseño de esquema y siembra de datos con PocketBase, cableado interactivo, pulido iterativo y diagnóstico en navegador). El agente ejecuta las herramientas disponibles directamente desde su entorno.

El objetivo pedagógico es demostrar que el desarrollador no desaparece: actúa como el **director técnico que establece fronteras de alcance, toma decisiones arquitectónicas tempranas y audita el resultado**, mientras la IA asume la ejecución acelerada, el modelado y el diseño de nivel de producción.

---

## 🔄 Flujo Maestro de Ejecución (Paso a Paso del Agente)

Para garantizar determinismo, velocidad y excelencia técnica dentro de la ventana de **40 ± 5 minutos**, el agente sigue este flujo secuencial:

```text
[T=00:00]  1. INICIO DEL RELOJ: Ejecutar `./timer.sh start`.
    │
[T=00:01]  2. REFLEXIÓN ARQUITECTÓNICA Y PASO 0:
    │         • Descomponer metódicamente la idea del público.
    │         • Elegir Patrón: A (Modal-Driven) o B (Multi-Página en pb_public/).
    │         • Fijar paleta oscura (Zinc/Slate void, acentos neón violet/cyan/emerald, glass-border).
    │         • Definir el esquema de la colección en PocketBase (declarando campos `created` y `updated` autodate).
    │
[T=02:00]  3. ACTIVACIÓN DE SKILLS: Validar lectura de las directivas en `.agents/skills/`.
    │
[T=03:00]  4. SCAFFOLDING VISUAL DIRECTO DEL FRONTEND:
    │         • Generar estructura base inicial con estética Dark Bento Grid, Glassmorphism y Shadcn Dark.
    │         • Exportar HTML nativo con Tailwind Play CDN, Google Fonts (Inter) y `tailwind-config` embebido a `pb_public/index.html`.
    │
[T=10:00]  5. PERSISTENCIA Y SEEDING CON POCKETBASE (Nativo):
    │         • Crear script de migración nativa en `pb_migrations/1710000000_seed.js`.
    │         • Iniciar `./pocketbase serve --http=127.0.0.1:8090` en segundo plano y comprobar respuesta HTTP.
    │         • Sembrar 12-20 registros con variedad de estados y métricas pobladas para poblar la vista.
    │
[T=16:00]  6. CABLEADO, PERSISTENCIA Y GESTIÓN DE ACCESO:
    │         • Conectar PocketBase JS SDK vía CDN (`pocketbase.umd.js`).
    │         • Reglas de API anti-bloqueo: declarar explícitamente lectura y escritura pública (`""`) o autenticada (`@request.auth.id != ""`).
    │         • Implementar modales nativos de HTML5 `<dialog>` estilizados con Tailwind crudo para login y operaciones CRUD.
    │         • Conectar render dinámico conservando la consistencia visual de los componentes.
    │
[T=24:00]  7. AUTORREGULACIÓN Y PULIDO ITERATIVO (Decisión Autónoma):
    │         • Ejecutar `./timer.sh status` para calcular el tiempo restante disponible.
    │         • Evaluar autónomamente mejoras de valor: micro-interacciones, animaciones de transición,
    │           validación de formularios, estados vacíos/carga, filtros avanzados o robustez de esquema.
    │         • Ejecutar las mejoras de forma iterativa cuidando estrictamente no exceder la ventana límite.
    │
[T=35:00]  8. VERIFICACIÓN DIAGNÓSTICA EN NAVEGADOR:
    │         • Navegar a `http://127.0.0.1:8090/`.
    │         • Verificar consola con 0 errores (el aviso de Tailwind Play CDN es un warn esperado).
    │         • PRUEBA REAL DE PERSISTENCIA: crear una cuenta, iniciar sesión, ejecutar una acción
    │           desde la interfaz y confirmar la actualización efectiva contra la API.
    │         • Confirmar el conteo sembrado y la distribución de estados en pantalla.
    │
[T=40:00]  9. CONGELAMIENTO, PUBLICACIÓN Y CIERRE:
    │         • Congelar código y presentar la aplicación operativa ante el público.
    │         • Proyectar la URL pública para acceso de los asistentes (ver §Rutas Fijas, Puerto y Publicación).
```

---

## 🎨 Estándar Estético: Tailwind CSS Crudo y Diseño de Alto Impacto

### 💎 Especificación Visual del Frontend
El HTML servido en `pb_public/index.html` utiliza el motor de Tailwind Play CDN con configuración embebida:

```html
<!-- Anti-Caché Global (Navegador, Proxies y CDN) -->
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate, max-age=0"/>
<meta http-equiv="Pragma" content="no-cache"/>
<meta http-equiv="Expires" content="0"/>

<!-- Tipografía e Iconos -->
<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet"/>
<script src="https://unpkg.com/lucide@latest"></script>

<!-- Tailwind CDN + Configuración de Tokens Visuales -->
<script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
<script id="tailwind-config">
    tailwind.config = {
        darkMode: "class",
        theme: {
            extend: {
                colors: {
                    "primary": "#6366f1",
                    "accent": "#06b6d4",
                    "glass-border": "rgba(255, 255, 255, 0.08)"
                },
                boxShadow: {
                    'glass': '0 8px 32px 0 rgba(0, 0, 0, 0.37)',
                    'neon': '0 0 20px -5px rgba(99, 102, 241, 0.5)'
                }
            }
        }
    }
</script>
```

- **Contenedores Glassmorphism:** `bg-zinc-900/60 backdrop-blur-xl border border-zinc-800/80 shadow-2xl rounded-2xl p-6 transition-all hover:border-zinc-700`.
- **Encabezados Neón:** `bg-gradient-to-r from-indigo-400 via-cyan-400 to-purple-400 text-transparent bg-clip-text font-black tracking-tight`.
- **Modales Nativos Estilo Shadcn:**
  `<dialog class="backdrop:bg-black/80 backdrop:backdrop-blur-sm bg-zinc-900 text-zinc-100 border border-zinc-800 rounded-2xl p-6 shadow-2xl max-w-lg w-full m-auto">`
- **Badges Fluorescentes:** `inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-semibold bg-emerald-500/10 text-emerald-400 border border-emerald-500/20`.
- **Indicador de Sistema Pulsante:** Punto verde esmeralda con animación `animate-ping` y etiqueta *"SISTEMA ONLINE"* (visible con sesión activa).
- **Puerta de Acceso (pantalla obligatoria):** mientras no haya sesión, la pantalla muestra el panel de bienvenida y acceso —título con gradiente neón, tarjeta glassmorphism y diálogos de autenticación (*Crear cuenta* / *Iniciar sesión*)—. La grilla de recursos y acciones operativas se protegen tras el inicio de sesión.

### 🚫 Política Estricta Anti-Caché (Frontend, API y Cloudflare)
Para evitar que proxies intermedios, CDNs o navegadores retengan HTML, archivos estáticos o respuestas JSON de la API:

1. **Meta tags en el HTML:** Todo documento en `pb_public/` incluye `<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate, max-age=0"/>`, `<meta http-equiv="Pragma" content="no-cache"/>` y `<meta http-equiv="Expires" content="0"/>`.
2. **Hook HTTP Global en `pb_hooks/nocache.pb.js`:** PocketBase inyecta cabeceras `Cache-Control: no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0`, `Pragma: no-cache`, `Expires: 0` y `CDN-Cache-Control: no-store` en **todas** las respuestas HTTP (estáticos y API REST):
   ```js
   routerUse((e) => {
       e.response.header().set("Cache-Control", "no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0");
       e.response.header().set("Pragma", "no-cache");
       e.response.header().set("Expires", "0");
       e.response.header().set("CDN-Cache-Control", "no-store");
       e.response.header().set("Cloudflare-CDN-Cache-Control", "no-store");
       return e.next();
   });
   ```
3. **SDK con `requestKey: null`:** En peticiones dinámicas que requieran evitar deduplicación o caché local del cliente, se asegura la solicitud directa al backend.

---

## 🌱 Estrategia de Seeding Automático (Anti-Cold Start con `pb_migrations/`)

Para asegurar una vista inicial poblada y verosímil cuando la app se abra en el navegador por primera vez, el agente siembra **12 a 20 registros creíbles** usando el motor nativo de migraciones:

1. **Ubicación Nativa:** El seeder se escribe en `pb_migrations/1710000000_seed.js`. PocketBase lo ejecuta en milisegundos al iniciar `./pocketbase serve`.
2. **Campos Autodate Obligatorios:** Al crear colecciones por código, **deben declararse explícitamente** los campos `created` y `updated` de tipo `autodate` en la lista de `fields`. Si faltan, las consultas ordenadas por `-created` devuelven error HTTP 400.
3. **Variedad de Estados:** Al menos tres registros por cada estado del flujo (`Pendiente` 🟡, `En Proceso` 🔵, `Resuelto` 🟢) para que los filtros y badges cromáticos muestren dinamismo real.
4. **Métricas con Datos:** Valores numéricos realistas y variados para alimentar contadores y resúmenes estadísticos.
5. **Contexto Realista:** Datos y nombres con contexto verosímil asociado a la temática solicitada por la audiencia.
6. **Verificación de Conteo:** Tras el arranque, confirmar por API el total (`totalItems` en PocketBase v0.40+) y la distribución de estados:
   ```bash
   curl -s "http://127.0.0.1:8090/api/collections/<coleccion>/records" \
     | python3 -c "import sys,json;d=json.load(sys.stdin);print(d['totalItems'])"
   ```
7. **Re-sembrado limpio:** `pb_data/` almacena el estado de la base de datos. Para reiniciar al estado base de migración: detener el servidor → `rm -rf pb_data` → servir nuevamente (la migración se re-ejecuta de inmediato).

---

## 🔐 Modelo Canónico de Permisos y Autoría (PocketBase)

**Principio rector:** Un usuario autenticado puede gestionar los registros creados por él (`creado_por = @request.auth.id`), mientras que las acciones colaborativas compartidas (ej. reservar un recurso disponible) se habilitan para cualquier usuario autenticado. Los superusuarios retienen acceso total.

### 1. El Campo de Autoría Obligatorio (`creado_por`)
Toda colección creada por código en `pb_migrations/1710000000_seed.js` debe incluir un campo de relación `creado_por`:
```javascript
{ name: "creado_por", type: "relation", collectionId: "_pb_users_auth_", maxSelect: 1, required: false }
```
Al crear registros desde el frontend, se asigna automáticamente:
```javascript
await pb.collection("recursos").create({
  ...datos,
  creado_por: pb.authStore.model?.id || ""
});
```

### 2. Matriz Canónica de Reglas API

Según la naturaleza del recurso en el MVP, se elige uno de estos dos esquemas:

#### Esquema A: Recursos Propios (Gestión Estricta del Creador)
*Ejemplo: Notas personales, publicaciones individuales, inventario propio.*
```javascript
listRule:   '@request.auth.id != ""',                       // Lectura para autenticados
viewRule:   '@request.auth.id != ""',                       // Detalle para autenticados
createRule: '@request.auth.id != ""',                       // Creación para autenticados
updateRule: 'creado_por = @request.auth.id || @request.auth.id = ""', // Solo el autor edita
deleteRule: 'creado_por = @request.auth.id',                // Solo el autor elimina
```

#### Esquema B: Recursos Compartidos con Transacciones Públicas (Pool / Renta / Reservas)
*Ejemplo: Bicicletas compartidas, pool de herramientas, reserva de espacios.*
```javascript
listRule:   '@request.auth.id != ""',
viewRule:   '@request.auth.id != ""',
createRule: '@request.auth.id != ""',
updateRule: '@request.auth.id != ""', // Permite transicionar estado sobre ítems disponibles
deleteRule: 'creado_por = @request.auth.id', // Solo el creador borra el ítem
```

### 3. Reglas de la Colección `users`
La colección `users` mantiene siempre `createRule: ""` para permitir el auto-registro libre de la audiencia sin intervención administrativa.

### 4. Control Visual en la Interfaz (Frontend)
- Los botones de **"Editar"** o **"Eliminar"** un ítem solo se renderizan si `r.creado_por === pb.authStore.model?.id` (o si el usuario es superusuario).
- Los botones de acción transaccional (**"Rentar"**, **"Reservar"**, **"Devolver"**, **"Completar"**) se muestran condicionados al estado del ítem (`r.estado === 'Disponible'`), permitiendo interactividad comunitaria en vivo.

---

## 🌐 Rutas Fijas, Puerto y Publicación (Cloudflare Tunnel)

### Rutas y puerto inamovibles

| Elemento | Valor fijo | Nota |
|---|---|---|
| Puerto de PocketBase | **8090** | El mismo en local y detrás del túnel. |
| Bind local | `--http=127.0.0.1:8090` | Óptimo para `cloudflared` en el mismo host. |
| Frontend | `/` → `pb_public/index.html` | PocketBase sirve el directorio estático. |
| API REST | `/api/collections/<coleccion>/records` | Único mecanismo de datos. |
| Dashboard de inspección | `/_/` | Acceso de administración / superusuario. |
| Dominio público / Túnel | `https://poc.jscomunicadores.com` | Redirigido al puerto local 8090. |

### Inicialización desacoplada del host
El cliente en el frontend se inicializa con **`new PocketBase(window.location.origin)`**. Esto permite que la misma app funcione de manera transparente en local, en red LAN y tras el dominio del túnel sin requerir reconfiguración de código.

---

## 🧭 Paso 0: Decisión Arquitectónica según el Brief del Público

| Patrón | Cuándo se elige | Implementación Técnica |
|---|---|---|
| **Patrón A: Modal-Driven (Pantalla Única)** | Ideal para tableros, feeds, catálogos o paneles donde las acciones son puntuales. | Todo vive en `pb_public/index.html`. El acceso, registro o formularios de creación se abren con modales nativos `<dialog>` estilizados con Tailwind crudo y `.showModal()`. Cero recarga de página. |
| **Patrón B: Multi-Página Nativa (2-3 Pantallas)** | Ideal para flujos con separación estricta de contextos (ej. Catálogo → Detalle → Panel Privado). | Archivos HTML planos independientes en `pb_public/` (`index.html`, `login.html`, `nuevo.html`) comunicados mediante enlaces estándar `<a>`. El navegador gestiona el historial nativamente. |

*Regla de Arquitectura:* Prohibido simular un enrutador SPA artesanal ocultando y mostrando `<div>`s con JavaScript (`hidden`).

### 🎨 Directiva de Estilo para Scaffolding Visual
El prompt o especificación visual inicial debe estructurarse con estos atributos:
```text
"Diseña un dashboard web moderno, ultra-elegante y de alto impacto con Tailwind CSS puro estilo Shadcn/Vercel Dark. Utiliza un fondo oscuro profundo (zinc-950/slate-950), contenedores glassmorphism con 'bg-zinc-900/60 backdrop-blur-xl border border-zinc-800/80 shadow-2xl rounded-2xl', barra superior con indicador pulsante 'ONLINE', título principal con gradiente neón ('bg-gradient-to-r from-indigo-400 via-cyan-400 to-purple-400 text-transparent bg-clip-text font-black'), tarjeta de estadísticas vibrante con iconos Lucide, grilla de tarjetas bento con badges fluorescentes y modales nativos (<dialog>) perfectamente estilizados para la interacción. 100% responsivo y listo para consumo estático sin empaquetador."
```

---

## ⏱️ Conciencia Temporal y Autorregulación del Agente

El agente consulta periódicamente su temporizador ejecutando `./timer.sh status`:

| Fase | Ventana de Tiempo | Meta Operativa | Comportamiento del Agente |
|---|---|---|---|
| **Fase 1: Núcleo MVP y Persistencia** | Minuto 00:00 – 14:00 | Persistencia y estructura base | Configuración de esquema PocketBase + Seeding nativo + Maquetación inicial de alto nivel con Tailwind. |
| **Fase 2: Conexión y Pulido Iterativo** | Minuto 14:00 – 32:00 | Conexión de datos + Pulido continuo | SDK JS de PocketBase + Glassmorphism, gradientes neón, contadores de estadísticas, badges, empty states, modales y refinamiento autónomo de valor. |
| **Fase 3: Verificación y Cierre** | Minuto 32:00 – 40:00 (máx 45m) | Diagnóstico y congelamiento | Verificación visual y de consola en navegador, prueba interactiva de persistencia y congelamiento de cambios. |

---

## 🚀 Autorregulación y Pulido Iterativo Autónomo

Cuando el agente alcance un MVP funcional en una etapa temprana (por ejemplo, en menos de 15 o 20 minutos), **debe evaluar autónomamente el tiempo restante con `./timer.sh status` y decidir avanzar en ciclos de pulido y refinamiento progresivo** para elevar la calidad global del producto sin salirse del límite de tiempo.

### Ejes de Mejora Prioritarios durante el Tiempo Restante:
1. **Refinamiento de UX y Micro-interacciones:**
   - Transiciones suaves (`transition-all duration-200 hover:scale-[1.01]`).
   - Estados de carga (spinners/skeletons al consultar o mutar datos).
   - Indicadores visuales de confirmación o mensajes de retroalimentación en formularios.
   - Estados vacíos (*empty states*) con iconografía y mensajes guiados cuando los filtros no devuelven resultados.
2. **Profundidad Funcional y de Dominio:**
   - Barra de búsqueda reactiva y filtros por categorías o estados.
   - Resumen estadístico dinámico calculado en tiempo real sobre los registros existentes.
   - Ordenamiento por fecha, prioridad o atributos relevantes del dominio.
3. **Robustez de Validación y Seguridad:**
   - Validación clara de campos requeridos y formatos en modales.
   - Manejo elegante de errores de autenticación o reglas de PocketBase en el modal de login/registro.
   - Cierre fluido de modales al presionar `Escape` o hacer clic en el backdrop.
4. **Modelado y Consistencia de Datos:**
   - Campos complementarios útiles en la colección (ej. badges descriptivos, timestamps formateados, métricas agregadas).
   - Verificación de consistencia en el formateo de monedas, fechas o porcentajes.

**Regla de Seguridad Temporal:** Cada ciclo de pulido debe ser atómico y no destructivo. Si el temporizador supera los 35 minutos, el agente suspende nuevas adiciones, ejecuta la verificación final y congela el código para la presentación.

---

## 📦 Alcance del MVP (Must-Haves vs. Non-Goals)

### ✅ Alcance Requerido (Must-Haves)
1. **Identidad Visual de Alto Impacto:** Tailwind CSS crudo, fondo oscuro profundo (`zinc-950`), tarjetas con glassmorphism (`backdrop-blur-xl border border-zinc-800`), encabezados con gradiente neón, tarjetas de métricas e indicador pulsante de estado.
2. **Persistencia Real en PocketBase con Seeding Abundante:** Colección poblada nativamente con **12 a 20 registros** de muestra, con al menos tres por estado para asegurar filtros y métricas representativas.
3. **Gestión de Permisos Coherente:** Reglas de API explícitas (`""` o `@request.auth.id != ""`) en lectura y escritura para permitir interactividad inmediata sin barreras no autenticadas indebidas.
4. **Frontend Cero-Empaquetador (`Zero-Bundler`):** Archivos servidos directamente desde `pb_public/` consumiendo PocketBase JS SDK y Tailwind Play CDN. Un solo proceso ejecutable (`./pocketbase serve`).
5. **Compatibilidad con Túnel Público:** Host y puerto tomados de `window.location.origin` para operar sin modificaciones bajo túneles HTTPS.

### 🚫 Catálogo de Exclusiones Explícitas (Non-Goals Anti-Sobreingeniería)
1. **🚫 Cero Enrutadores SPA Artesanales:** Sin código JavaScript artesanal para alternar contenedores ocultos.
2. **🚫 Cero Frameworks CSS de Componentes Pre-empaquetados:** Todo el estilizado es Tailwind CSS crudo mediante clases utilitarias.
3. **🚫 Cero Conmutadores de Tema Dinámicos:** El diseño queda fijado en modo oscuro refinado.
4. **🚫 Cero Flujos Externos de Autenticación / Email:** Sin confirmación por correo, reset de contraseña por SMTP ni proveedores OAuth externos. El auto-registro local (correo + contraseña) es directo.
5. **🚫 Cero Librerías Pesadas de Validación en Cliente:** Validación HTML5 nativa combinada con la validación de esquema de PocketBase.
6. **🚫 Cero Internacionalización (i18n):** Contenido redactado directamente en español.
7. **🚫 Cero SDKs de Almacenamiento Cloud:** Archivos locales o URLs simples en PocketBase.
8. **🚫 Cero Polling Manual por JS / WebSockets Artesanales:** El mecanismo de datos es el SDK JS de PocketBase.
9. **🚫 Cero Exportación a PDF/Excel:** Sin librerías pesadas en cliente.
10. **🚫 Cero Pasos de Compilación (`Zero Build Step`):** Sin Node.js, Vite ni Webpack para servir el frontend; PocketBase sirve los estáticos.

---

## ⚡ Stack Tecnológico y Habilidades (`.agents/skills/`)

- **Backend / Persistencia / Servidor Web:** PocketBase **v0.40.4** (sirve la API REST y estáticos desde `pb_public/`).
- **Frontend UI / Estilos:** Tailwind CSS crudo (Tailwind Play CDN con plugins de forms y container-queries) + Lucide Icons + Google Fonts (Inter).
- **Consumo de Datos:** PocketBase JS SDK (`pocketbase.umd.js` vía CDN).
- **Modo Operativo:** **100% Monoagente.**

### Habilidades Activas (5 Esenciales)
1. **`pocketbase-integration`:** Patrones de consulta, reglas y autenticación con PocketBase JS SDK.
2. **`database-seeding`:** Siembra automática y nativa de datos realistas mediante `pb_migrations/`.
3. **`tailwind-zero-bundler`:** Patrones de maquetación con Tailwind CSS crudo y vistas limpias.
4. **`incremental-implementation`:** Desarrollo por rebanadas funcionales delgadas (slice by slice).
5. **`context-engineering`:** Gestión óptima de contexto sin tokens redundantes.

---

## 🛑 Directiva Monoagente Estricta

El agente principal asume de manera directa e ininterrumpida todas las fases de ejecución mediante sus herramientas nativas (ejecución de comandos, inspección de navegador y edición de archivos). Esto garantiza determinismo, fluidez continua y control total durante la ventana de **40 ± 5 minutos**.

---

## 📚 Fuentes de Verdad (Precedencia Documental)

Ante cualquier contradicción entre documentos del proyecto, se aplica este orden:

| Orden | Documento | Autoridad |
|---|---|---|
| 1 | `AGENTS.md` (este archivo) | Única fuente de verdad de alcance, arquitectura, fases y directivas. |
| 2 | `.agents/skills/*/SKILL.md` | Directivas de implementación, siempre dentro del alcance fijado por el orden 1. |
| 3 | `README.md` | Vista general y documentación pública. |
| 4 | `timer.sh` | Instrumento de medición temporal del experimento. |
