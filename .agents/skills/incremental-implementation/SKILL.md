---
name: incremental-implementation
description: Directiva de desarrollo por rebanadas funcionales delgadas (slice by slice). Cada cambio mantiene el proyecto 100% funcional.
---

# Skill: Incremental Implementation

## Principios
1. **Vertical Slices Delgadas:** Implementa una sola funcionalidad completa a la vez (interfaz en `pb_public/` + llamada al SDK JS de PocketBase + colección o endpoint).
2. **Estado Funcional Continuo:** No rompas el `index.html` ni introduzcas cambios globales incompletos.
3. **Validación Inmediata:** Cada incremento debe ser inmediatamente ejecutable y verificable en navegador.
