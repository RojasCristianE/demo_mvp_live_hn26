# 🚀 Demo MVP Live — Hackathon Nicaragua Kronox 2026

> **Este README es la vista de entrada.** La fuente de verdad de arquitectura, alcance, fases y flujo de ejecución es [`AGENTS.md`](./AGENTS.md). Ante cualquier contradicción, manda `AGENTS.md`.

---

## 🎯 Objetivo del Experimento en Vivo

Construir en tiempo real un **MVP funcional, estéticamente moderno, refinado y de alto impacto visual** a partir de una **idea propuesta por el público** del Centro de Convenciones Olof Palme, en una ventana estricta de **40 ± 5 minutos**, utilizando un flujo **100% monoagente**.

El propósito pedagógico es demostrar cómo la Inteligencia Artificial asume la ejecución acelerada y el diseño estético de vanguardia, mientras el desarrollador actúa como **director técnico** definiendo fronteras de alcance, arquitectura y verificando los resultados en vivo.

---

## 🌐 Acceso Público en Vivo

El proyecto se expone y sincroniza en tiempo real para que la audiencia interactúe desde sus propios dispositivos móviles:

🔗 **URL Pública Oficial:** [https://poc.jscomunicadores.com](https://poc.jscomunicadores.com)  
*(Redirigida automáticamente al puerto local 8090 mediante túnel de Cloudflare)*

> **Política Anti-Caché:** Tanto el frontend como la API REST viajan con cabeceras estrictas `Cache-Control: no-store, no-cache` y bypass de CDN para reflejar cambios instantáneamente sin almacenamiento en caché.

---

## ⚡ Stack Tecnológico

- **Backend / Persistencia / Servidor Web:** [PocketBase](https://pocketbase.io/) (binario único + SQLite en `0.40.4`). Sirve la API REST, ejecuta las migraciones automáticas (`pb_migrations/`), hooks anti-caché (`pb_hooks/`) y publica los estáticos desde `pb_public/`.
- **Frontend UI / Estilos:** HTML plano servido directamente desde `pb_public/` (**Zero-Bundler**). Tailwind CSS crudo (Tailwind Play CDN) + Lucide Icons + Google Fonts (Inter) con estética Dark Bento Grid / Glassmorphism tipo Shadcn Dark.
- **Consumo de Datos:** PocketBase JS SDK (`pocketbase.umd.js`) consumiendo `window.location.origin`. Único mecanismo de datos del MVP.
- **Seeding Automático:** Motor nativo de migraciones de PocketBase (`pb_migrations/1710000000_seed.js`) sembrando entre 12 y 20 registros con diversidad de estados para evitar el *cold start*.

---

## 🚀 Arranque y Ejecución

```bash
# 1. Iniciar el temporizador del experimento (T=00:00 - Límite: 40 ± 5 min)
./timer.sh start

# 2. Servir la aplicación y base de datos en el puerto 8090
./pocketbase serve --http=127.0.0.1:8090
```

### 📍 Puntos de Acceso:
- **Local:** `http://127.0.0.1:8090/`
- **Público (Audiencia):** `https://poc.jscomunicadores.com`
- **Dashboard Administrativo:** `http://127.0.0.1:8090/_/` *(Uso exclusivo del expositor)*

Para consultar el tiempo transcurrido y la fase activa:
```bash
./timer.sh status
```

---

## 🔐 Modelo de Acceso e Interacción

- **Auto-registro Abierto:** Cualquier participante de la audiencia puede registrar su propia cuenta desde el modal de la interfaz.
- **Permisos y Propiedad:** Los usuarios pueden crear registros y modificar únicamente aquellos de su autoría (`creado_por`), además de ejecutar acciones comunitarias (ej. rentar/tomar ítems disponibles en tiempo real).

---

## 🧭 Fuentes de Documentación

| Documento | Rol |
|---|---|
| [`AGENTS.md`](./AGENTS.md) | **Fuente de verdad:** alcance, fases, modelo de permisos, políticas anti-caché y flujo maestro. |
| `.agents/skills/` | Directivas técnicas por dominio (PocketBase, seeding, Tailwind crudo, incremental, contexto). |
| `timer.sh` | Instrumento de medición y fases operativas del experimento. |
