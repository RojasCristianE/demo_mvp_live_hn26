---
name: tailwind-zero-bundler
description: Directivas para desarrollo frontend en pb_public/ sin empaquetadores usando Tailwind CSS crudo y arquitectura limpia de vistas.
---

# Skill: Zero-Bundler Frontend (Tailwind CSS Crudo & Clean View Patterns)

## Reglas de Arquitectura de Vistas
1. **Paso 0 — Selección de Patrón:**
   - **Patrón A (Modal-Driven):** Si la app es un tablero, lista o feed, usa `pb_public/index.html`. Las acciones (login, nuevo registro) se abren en `<dialog>` nativo de HTML5 con `.showModal()`.
   - **Patrón B (Multi-Página Nativa):** Si la app tiene flujos claramente separados, crea páginas independientes en `pb_public/` (`index.html`, `login.html`, `crear.html`) comunicadas con enlaces `<a>` estándar.
2. **Prohibición de SPAs Artesanales:**
   - Queda estrictamente prohibido simular un enrutador SPA alternando `hidden` con JavaScript.
3. **Estética Tailwind Crudo (Alto Impacto Visual / Shadcn Dark):**
   - **Tailwind Puro:** Utilizar exclusivamente clases utilitarias de Tailwind CSS.
   - **CDN & Configuración Embebida (con Anti-Caché Global):**
     ```html
     <!-- Anti-Caché Global -->
     <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate, max-age=0"/>
     <meta http-equiv="Pragma" content="no-cache"/>
     <meta http-equiv="Expires" content="0"/>

     <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800;900&display=swap" rel="stylesheet"/>
     <script src="https://unpkg.com/lucide@latest"></script>
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
   - **Contenedores y Tarjetas:** `bg-zinc-900/60 backdrop-blur-xl border border-zinc-800/80 shadow-2xl rounded-2xl p-6 hover:border-zinc-700 transition-all`.
   - **Modales Nativos Estilo Shadcn:**
     `<dialog class="backdrop:bg-black/80 backdrop:backdrop-blur-sm bg-zinc-900 text-zinc-100 border border-zinc-800 rounded-2xl p-6 shadow-2xl max-w-lg w-full m-auto">`
   - **Badges Fluorescentes:** `inline-flex items-center px-2.5 py-0.5 rounded-full text-xs font-medium border` con fondos translúcidos (`bg-emerald-500/10 text-emerald-400 border-emerald-500/20`, etc.).
   - **Iconografía:** Lucide Icons vía CDN (`<script src="https://unpkg.com/lucide@latest"></script>` con llamada a `lucide.createIcons()`) o SVG inline.
4. **Sin HTMX:**
   - El único mecanismo de datos es el PocketBase JS SDK (`pocketbase.umd.js` vía CDN).
