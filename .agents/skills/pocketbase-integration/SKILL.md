---
name: pocketbase-integration
description: Directivas para integración rápida y liviana con PocketBase como Backend & DB.
---

# Skill: PocketBase Integration

## Reglas de Integración
1. **API REST / JS SDK vía CDN:** Usa la librería JS de PocketBase vía CDN (`https://unpkg.com/pocketbase/dist/pocketbase.umd.js`) o peticiones `fetch()` directas a `http://127.0.0.1:8090/api/collections/...`. Es el único mecanismo de datos del MVP.
2. **Operaciones CRUD Directas:**
   - Listar registros: `GET /api/collections/{collection}/records`
   - Crear registro: `POST /api/collections/{collection}/records`
   - Actualizar registro: `PATCH /api/collections/{collection}/records/{id}`
   - Eliminar registro: `DELETE /api/collections/{collection}/records/{id}`
3. **Colecciones y Reglas de API (Matriz Canónica de Permisos):**
   - **Campo de Autoría Obligatorio:** Toda colección debe incluir `{ name: "creado_por", type: "relation", collectionId: "_pb_users_auth_", maxSelect: 1, required: false }`.
   - **Recursos Propios (Edición estricta del autor):**
     ```js
     listRule:   '@request.auth.id != ""',
     viewRule:   '@request.auth.id != ""',
     createRule: '@request.auth.id != ""',
     updateRule: 'creado_por = @request.auth.id',
     deleteRule: 'creado_por = @request.auth.id',
     ```
   - **Recursos Compartidos / Renta / Pool (Acción comunitaria sobre disponibles):**
     ```js
     listRule:   '@request.auth.id != ""',
     viewRule:   '@request.auth.id != ""',
     createRule: '@request.auth.id != ""',
     updateRule: '@request.auth.id != ""', // Permite interactuar/rentar
     deleteRule: 'creado_por = @request.auth.id', // Solo el dueño elimina
     ```
   - **Colección `users`:** Siempre debe tener `createRule: ""` para permitir el auto-registro libre.
   - **Prohibición de `null` por omisión:** Nunca omitir reglas, ya que PocketBase las deja en `null` (solo superusuario) bloqueando las acciones de los usuarios comunes.

## Registro, Sesión y Autoría en Frontend

Cada participante crea **su propia cuenta** desde la interfaz.

```js
// Alta de cuenta (modal "Crear cuenta")
await pb.collection('users').create({ email, password, passwordConfirm: password });

// Inicio de sesión (modal "Iniciar sesión")
const auth = await pb.collection('users').authWithPassword(email, password);

// Asignación obligatoria de autoría al crear registros
await pb.collection('recursos').create({ 
  ...datos, 
  creado_por: pb.authStore.model?.id || "" 
});

// En la vista: botones Editar/Borrar solo para el autor
const esMio = r.creado_por === pb.authStore.model?.id;
```

4. **Host y puerto:** Inicializa el cliente con `new PocketBase(window.location.origin)`. **Prohibido codificar `http://127.0.0.1:8090` en el frontend**, porque eso rompe la app cuando se publica detrás del túnel de Cloudflare.
5. **Cero Caché Obligatorio (Local, CDN y Cloudflare):**
   - Siempre incluye `pb_hooks/nocache.pb.js` para inyectar cabeceras `Cache-Control: no-store, no-cache, must-revalidate, max-age=0`, `Pragma: no-cache` y `CDN-Cache-Control: no-store` en todas las respuestas.
   - En peticiones dinámicas del SDK o fetch, evitar deduplicaciones indeseadas pasando `{ requestKey: null }` si se requiere refresco forzado.
6. **Versiones:** El SDK JS se versiona aparte del servidor. Fija la versión en la URL del CDN (no uses `latest`) y comprueba que devuelva **200** antes del reloj. En **PocketBase 0.40** el campo de total en las listas es **`totalItems`** (antes `totalRecords`).
