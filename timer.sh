#!/usr/bin/env bash
# timer.sh — Monitor de tiempo para la demo en vivo de 40 +/- 5 minutos

TIMER_FILE=".timer_start"
MAX_SECONDS=2400 # 40 minutos objetivo (ventana tolerable 35 a 45 min)
HARD_LIMIT=2700  # 45 minutos límite absoluto

action="${1:-status}"

if [ "$action" = "start" ]; then
    date +%s > "$TIMER_FILE"
    echo "⏱️ Temporizador iniciado a las $(date +%T). Objetivo: 40 minutos (ventana: 35-45m)."
    exit 0
fi

if [ ! -f "$TIMER_FILE" ]; then
    echo "⚠️ El temporizador no ha sido iniciado. Ejecuta: ./timer.sh start"
    exit 1
fi

start_time=$(cat "$TIMER_FILE")
now=$(date +%s)
elapsed=$((now - start_time))
remaining=$((MAX_SECONDS - elapsed))

elapsed_min=$((elapsed / 60))
elapsed_sec=$((elapsed % 60))

if [ $elapsed -gt $HARD_LIMIT ]; then
    echo "🚨 TIEMPO AGOTADO: Han transcurrido ${elapsed_min}m ${elapsed_sec}s (límite absoluto de 45m superado)."
    exit 0
elif [ $remaining -lt 0 ]; then
    echo "⚠️ MARGEN EXTRA: Han transcurrido ${elapsed_min}m ${elapsed_sec}s (en ventana de extensión 40-45m)."
fi

rem_min=$((remaining / 60))
rem_sec=$((remaining % 60))

echo "⏱️ TIEMPO: Transcurrido: ${elapsed_min}m ${elapsed_sec}s | Restante: ${rem_min}m ${rem_sec}s"

if [ $elapsed -lt 840 ]; then
    echo "📍 FASE ACTUAL: Fase 1 — Núcleo MVP y Persistencia (0-14m: Patrón + Scaffolding Visual + Seeding)."
elif [ $elapsed -lt 1920 ]; then
    echo "📍 FASE ACTUAL: Fase 2 — Conexión y Pulido Iterativo (14-32m: UI Glassmorphic + SDK PocketBase + Refinamiento)."
else
    echo "📍 FASE ACTUAL: Fase 3 — Cierre y Validación (32-40m: Diagnóstico en Navegador + Congelamiento)."
fi
