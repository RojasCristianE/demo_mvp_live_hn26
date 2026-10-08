// pb_hooks/nocache.pb.js
// Inyecta cabeceras anti-caché en TODAS las respuestas (estáticos + API REST).
// Imprescindible para que Cloudflare y navegadores no sirvan versiones antiguas.

routerUse((e) => {
    e.response.header().set("Cache-Control",              "no-store, no-cache, must-revalidate, proxy-revalidate, max-age=0");
    e.response.header().set("Pragma",                     "no-cache");
    e.response.header().set("Expires",                    "0");
    e.response.header().set("CDN-Cache-Control",          "no-store");
    e.response.header().set("Cloudflare-CDN-Cache-Control","no-store");
    return e.next();
});
