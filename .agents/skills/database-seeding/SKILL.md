---
name: database-seeding
description: Directivas para poblar y sembrar automáticamente datos creíbles en PocketBase usando el motor nativo pb_migrations/.
---

# Skill: Database Seeding (Nativo PocketBase)

## Principios de Seeding
1. **Zero Dependencias:** Utiliza el motor nativo de migraciones de PocketBase. Todo script de siembra se ubica en `pb_migrations/` con extensión `.js` (ej. `pb_migrations/1710000000_seed.js`).
2. **Ejecución Automática:** PocketBase ejecuta las migraciones de forma inmediata al arrancar el servidor (`./pocketbase serve`).

## Reglas de Datos para la Demostración en Vivo
1. **Diversidad Cromática Obligatoria (Anti-Cold Start):**
   - **Genera entre 12 y 20 registros de muestra.** Cinco es demasiado poco: la grilla queda escasa, los filtros dejan una sola tarjeta en pantalla y el panel de métricas no tiene de dónde sacar números que impresionen.
   - Distribuye los registros entre todos los estados del ciclo de vida (`Pendiente`, `En Proceso`, `Resuelto`) con **al menos 3 registros por estado**, para que los badges fluorescentes (`amber-400`, `sky-400`, `emerald-400`) y los filtros cobren vida desde el primer renderizado.
   - Usa un arreglo de datos y un bucle, no una variable por registro: con 12-20 elementos el código por registro se vuelve inmanejable dentro del reloj.
2. **Realismo y Contexto:**
   - Escribe títulos y descripciones creíbles y contextualizados a la idea elegida por el público.
   - Prohibido usar textos genéricos como *"Test 1"*, *"Prueba"*, *"Lorem ipsum"*.
3. **Métricas con Datos:**
   - Asigna valores numéricos reales a contadores (votos, apoyos, precios, fechas) para que los bloques `stats` muestren números atractivos en pantalla.

## Estructura del Script de Migración JS

```javascript
migrate((app) => {
    const collection = app.findCollectionByNameOrId("nombre_coleccion");

    // 12 a 20 registros: al menos 3 por cada estado
    const datos = [
        { titulo: "Registro descriptivo 1", estado: "Pendiente",   metrica: 12 },
        { titulo: "Registro descriptivo 2", estado: "En Proceso", metrica: 27 },
        { titulo: "Registro descriptivo 3", estado: "Resuelto",   metrica: 45 },
        // … completar hasta 12-20, repartidos entre los tres estados
    ];

    for (const d of datos) {
        const r = new Record(collection);
        r.set("titulo", d.titulo);
        r.set("estado", d.estado);
        r.set("metrica", d.metrica);
        app.save(r);
    }
});
```

## Verificación de la Siembra (obligatoria)

Una siembra no se considera exitosa porque el servidor arrancó. Se confirma con el **conteo real** y con una consulta ordenada por `-created`:

```bash
curl -s "http://127.0.0.1:8090/api/collections/<coleccion>/records" \
  | python3 -c "import sys,json;print(json.load(sys.stdin)['totalItems'])"
curl -s -o /dev/null -w "%{http_code}\n" \
  "http://127.0.0.1:8090/api/collections/<coleccion>/records?sort=-created"
```

- En **PocketBase 0.40** el campo de total es **`totalItems`** (antes era `totalRecords`).
- El `sort=-created` debe devolver **200**; un **400** significa que faltan los campos `autodate` en la colección.
- `pb_data/` **es** el estado: para re-sembrar desde cero hay que detener el servidor, borrar `pb_data/` y volver a servir.
