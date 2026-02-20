# Tienda de Especias - Astro E-commerce

Una tienda online de especias premium construida con Astro, optimizada para SEO y conforme con la legislación española de comercio electrónico.

## 🌟 Características

### 🎯 SEO Optimizado
- **Meta etiquetas completas**: Title, Description, Keywords
- **Open Graph (OG) tags**: Para compartir en redes sociales
- **Estructura de datos JSON-LD**: Para mejorar la visibilidad en motores de búsqueda
- **Sitemap.xml**: Generado automáticamente por Astro
- **Robots.txt**: Configuración para crawlers
- **Canonical URLs**: Para evitar contenido duplicado
- **Breadcrumbs**: Navegación estructurada

### 📱 Características Técnicas
- **Responsive Design**: Compatible con todos los dispositivos
- **Lenguaje**: Español para SEO local
- **Rendimiento**: Optimizado con Astro para máxima velocidad
- **Accesibilidad**: Cumple con estándares WCAG

### 🏪 Funcionalidades E-commerce
- **Catálogo de productos**: Con imágenes y descripciones
- **Páginas de producto**: SEO-friendly con estructura schema
- **Carrito de compras**: Sistema básico implementado
- **Búsqueda y filtros**: Para mejor experiencia del usuario

### ⚖️ Conformidad Legal
- **Aviso Legal**: Cumple con LSSI-CE
- **Política de Privacidad**: RGPD y LOPD
- **Términos y Condiciones**: Para transacciones

## 📁 Estructura del Proyecto

```
src/
├── pages/
│   ├── index.astro                  # Página principal
│   ├── products/
│   │   ├── pimienta-negra.astro     # Producto: Pimienta Negra
│   │   ├── canela-en-polvo.astro    # Producto: Canela en Polvo
│   │   └── curcuma.astro             # Producto: Cúrcuma
│   ├── recetas-con-especias.astro   # Blog: Recetas
│   ├── beneficios-de-las-especias.astro # Blog: Beneficios
│   ├── como-usar-especias.astro     # Blog: Consejos
│   ├── donde-comprar-especias.astro # Blog: Dónde Comprar
│   ├── legal-notice.astro            # Aviso Legal
│   └── politica-privacidad.astro    # Política de Privacidad
├── layouts/
│   └── SeoLayout.astro               # Layout con SEO meta tags
├── components/
│   └── StructuredData.astro         # Schema JSON-LD
├── data/
│   └── products.json                 # Datos de productos
└── styles/
    └── (Estilos CSS)

public/
├── images/                           # Imágenes de productos
├── robots.txt                        # Configuración para crawlers
└── sitemap.xml                       # Mapa del sitio (generado)

astro.config.mjs                     # Configuración de Astro
```

## 🔍 Keywords Principales

### Palabras Clave Objetivo
- Comprar especias online España
- Pimienta negra de calidad
- Canela en polvo natural
- Cúrcuma pura
- Especias para cocinar
- Tienda especias online

### Long-tail Keywords
- Donde comprar especias de calidad en línea
- Cómo usar especias en la cocina
- Beneficios saludables de las especias
- Especias aromáticas para postres
- Envío rápido especias España

## 📊 SEO Optimizaciones Implementadas

### On-page SEO
- ✅ Títulos únicos y descriptivos
- ✅ Meta descripciones de 155-160 caracteres
- ✅ Keywords en contenido (natural, sin spam)
- ✅ Estructura de encabezados (H1, H2, H3)
- ✅ URLs amigables (/donde-comprar-especias)
- ✅ Imágenes optimizadas con alt text

### Technical SEO
- ✅ Sitemap.xml generado automáticamente
- ✅ Robots.txt configurado
- ✅ URL canónica en todas las páginas
- ✅ Schema markup (JSON-LD)
- ✅ Open Graph tags
- ✅ Mobile-first responsive design
- ✅ Fast page load times
- ✅ Structured data breadcrumbs

### Off-page SEO
- ✅ Enlaces internos estratégicos
- ✅ Vínculos entre páginas de blog
- ✅ Menciones de marca
- ✅ Preposicionamiento para búsquedas locales

## 🚀 Cómo Ejecutar

### Instalación
```bash
npm install
```

### Desarrollo
```bash
npm run dev
```
Abre http://localhost:3000 en tu navegador.

### Build para Producción
```bash
npm run build
```

### Preview
```bash
npm run preview
```

## 📦 Dependencias

- **Astro**: Framework web rápido
- **@astrojs/mdx**: Soporte para MDX
- **@astrojs/sitemap**: Generación automática de sitemap

## 🎨 Personalización

### Cambiar Información de la Empresa
Edita los siguientes archivos:
- `astro.config.mjs` - URL del sitio
- `src/pages/index.astro` - Información de la empresa
- `src/pages/legal-notice.astro` - Datos legales

### Agregar Productos
1. Edita `src/data/products.json`
2. Agrega el producto con nombre, descripción, precio e imagen
3. Crea una página en `src/pages/products/[producto].astro`

### Agregar Páginas de Blog
1. Crea un archivo `.astro` en `src/pages/`
2. Implementa los meta tags SEO
3. Agrega el enlace en la navegación

## 📈 Recomendaciones para Ranking

1. **Contenido de Calidad**: Mantén actualizado el blog con recetas y consejos
2. **Backlinks**: Busca enlaces desde otros sitios de cocina y gastronomía
3. **Velocidad de Carga**: Optimiza imágenes continuamente
4. **Mobile Optimization**: Asegúrate de que funciona perfectamente en móviles
5. **Redes Sociales**: Comparte contenido para generar engagement
6. **Local SEO**: Registra en Google My Business
7. **Reviews**: Solicita reseñas de clientes para aumentar credibilidad

## 📞 Soporte Legal

Este sitio está configurado para cumplir con:
- ✅ Ley de Servicios de la Sociedad de la Información (LSSI-CE)
- ✅ Reglamento General de Protección de Datos (RGPD)
- ✅ Ley Orgánica de Protección de Datos (LOPD)
- ✅ Normas de comercio electrónico en España

## 📝 Licencia

Uso autorizado únicamente con licencia de distribución en España.

## 🔗 Enlaces Útiles

- [Documentación de Astro](https://docs.astro.build)
- [SEO en Astro](https://docs.astro.build/es/guides/astro-db/sql/)
- [Google Search Console](https://search.google.com/search-console)
- [Bing Webmaster Tools](https://www.bing.com/webmasters)