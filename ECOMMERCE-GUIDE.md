# E-Commerce Tienda de Especias - Guía Completa

Una tienda online profesional de especias construida con Astro, con funcionalidad completa de WooCommerce incluyendo carrito de compra, checkout y procesamiento de pedidos.

## 🛒 Características E-Commerce

### Sistema de Carrito
- **Carrito Persistente**: Los artículos se guardan en localStorage incluso después de cerrar el navegador
- **Actualización en Tiempo Real**: El contador del carrito se actualiza instantáneamente
- **Gestión de Cantidades**: Aumentar/disminuir cantidades directamente en el carrito
- **Eliminación de Artículos**: Quitar productos del carrito con un clic

### Páginas Principales

#### 1. Página Principal (/)
- Catálogo de productos con grid responsive
- Vista previa de productos con imagen, nombre, descripción y precio
- Botón "Ver Detalles" para acceder a la página del producto
- Carrito visible en la navegación con contador de artículos

#### 2. Página de Producto (/producto/[id])
- Información detallada del producto
- Imagen grande del producto
- Descripción completa
- Características principales
- Selector de cantidad con botones +/-
- Botón "Añadir al carrito" con notificación de éxito
- Productos relacionados
- Schema.org JSON-LD para SEO

#### 3. Carrito (/carrito)
- Vista completa de todos los artículos en el carrito
- Imagen de producto, nombre, descripción y precio unitario
- Control de cantidad para cada artículo
- Botón para eliminar artículos
- Resumen del carrito con:
  - Subtotal
  - Costo de envío (Gratis en esta tienda)
  - Total a pagar
- Botones para:
  - "Ir al Pago" (proceder al checkout)
  - "Continuar Comprando" (volver a la tienda)

#### 4. Checkout (/checkout)
- Formulario de entrega con campos:
  - Nombre completo
  - Correo electrónico
  - Teléfono
  - Dirección
  - Ciudad
  - Código postal
  - Comunidad autónoma (con lista completa de españolas)
- Formulario de pago con campos:
  - Titular de la tarjeta
  - Número de tarjeta (formateado automáticamente)
  - Fecha de vencimiento
  - CVV
- Resumen del pedido con lista de artículos
- Cálculo automático del total
- Validación de formulario antes de enviar

#### 5. Confirmación (/confirmation)
- Mensaje de éxito con número de pedido generado
- Estado del pedido con timeline visual:
  - ✓ Pago Procesado
  - 📦 Envío Preparado
  - 🚚 En Camino
  - 📍 Entregado
- Información de envío:
  - Plazo de entrega
  - Costo de envío
  - Método de envío
- Pasos siguientes
- Información de contacto
- Botones de acción:
  - "Seguir Comprando"
  - "Ver Recetas"

## 🧩 Componentes Técnicos

### CartIcon.astro
- Icono de carrito en la navegación
- Contador de artículos dinámico
- Enlace directo al carrito (/carrito)
- Actualización automática cuando se añaden/quitan artículos

### AddToCartButton.astro
- Selector de cantidad integrado (botones +/-)
- Botón "Añadir al carrito"
- Notificación de éxito con animación
- Estilos responsivos para móvil

## 💾 Gestión de Datos

### localStorage
El carrito se almacena en el navegador del cliente bajo la clave `k2spiceshop_cart` con la siguiente estructura:

```json
[
  {
    "id": 1,
    "name": "Pimienta Negra",
    "price": 5.99,
    "image": "/images/pimienta-negra.jpg",
    "description": "...",
    "quantity": 2
  }
]
```

### Productos (src/data/products.json)
```json
[
  {
    "id": 1,
    "name": "Pimienta Negra",
    "description": "Pimienta negra de alta calidad...",
    "price": 5.99,
    "image": "/images/pimienta-negra.jpg"
  }
]
```

## 🔄 Flujo del Cliente

1. **Explorar**: Usuario visita la tienda y ve el catálogo de productos
2. **Detalles**: Haz clic en un producto para ver más información
3. **Añadir**: Selecciona cantidad y haz clic en "Añadir al carrito"
4. **Carrito**: Revisa los artículos, actualiza cantidades o elimina artículos
5. **Checkout**: Completa el formulario de dirección y pago
6. **Confirmación**: Recibe número de pedido y confirmación de pago

## 🎨 Diseño y UX

### Responsivo
- Compatible con todos los dispositivos (móvil, tablet, desktop)
- Layouts adaptables con CSS Grid
- Imágenes optimizadas con lazy loading

### Accesibilidad
- Nombres de formulario descriptivos
- Labels asociados a inputs
- Contraste de colores accesible
- Navegación Clara

### SEO
- Meta tags descriptivos en cada página
- Schema.org JSON-LD para productos
- URLs amigables
- Canonical URLs
- Open Graph tags para redes sociales

## 📱 Páginas Incluidas

### Información
- `/` - Página principal (catálogo)
- `/producto/[id]` - Detalle de producto
- `/carrito` - Carrito de compra
- `/checkout` - Pago
- `/confirmation` - Confirmación

### Blog / Contenido
- `/recetas-con-especias` - Recetas
- `/beneficios-de-las-especias` - Beneficios
- `/como-usar-especias` - Consejos
- `/donde-comprar-especias` - Dónde Comprar

### Informativo
- `/contacto` - Contacto
- `/envios` - Información de envíos
- `/devoluciones` - Política de devoluciones
- `/terminos-condiciones` - Términos y condiciones
- `/legal-notice` - Aviso Legal
- `/politica-privacidad` - Política de Privacidad

## 🔐 Seguridad

### En Producción
Para un sitio real, debes implementar:
1. **Procesamiento de pagos real**: Integrar con Stripe, PayPal o similar
2. **Validación de servidor**: No confíes solo en validación de cliente
3. **Base de datos**: Guardar pedidos en una base de datos
4. **HTTPS**: Usar certificado SSL
5. **PCI Compliance**: Cumplir con estándares de seguridad de pago

## 🚀 Cómo Extender

### Añadir Más Productos
1. Edita `src/data/products.json`
2. Agrega un objeto con `id`, `name`, `description`, `price`, `image`
3. Los productos aparecerán automáticamente en la tienda

### Cambiar Información de Contacto
- Actualiza `src/pages/contacto.astro`
- Modifica enlaces de email y teléfono
- Cambia horarios de atención

### Personalizar Estilos
- Cambia colores primarios en los archivos `.astro`
- Busca `#d9534f` para el color rojo principal
- Busca `#2c3e50` para el color gris oscuro

## 📊 Estadísticas de Rendimiento

Este sitio está optimizado para:
- **Velocidad**: Astro genera HTML estático
- **SEO**: Incluye todos los meta tags necesarios
- **Conversión**: Flujo de compra intuitivo
- **Móvil**: Diseño responsive completo

## 📞 Soporte

Todas las páginas informativas incluyen información de contacto:
- Email: contacto@tiendadeespecias.com
- Teléfono: +34 123 456 789
- Dirección: Calle Ejemplo, 123, Madrid

## ✅ Checklist para Lanzar

- [ ] Cambiar información de empresa  
- [ ] Añadir imágenes de productos reales
- [ ] Configurar procesamiento de pagos real
- [ ] Configurar email de confirmación
- [ ] Probar flujo completo de compra
- [ ] Asegurarse HTTPS está activo
- [ ] Registrar en Google Search Console
- [ ] Registrar en Google My Business
- [ ] Crear backups regulares
- [ ] Monitorear rendimiento y errores