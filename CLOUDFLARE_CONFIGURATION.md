# Cloudflare Configuration Guide for k2spiceshop.com

Complete step-by-step configuration for optimal performance, security, and SEO.

## 🎯 Quick Overview

**What You Need:**
- Domain: k2spiceshop.com
- Cloudflare Account (free tier works)
- Cloudflare Pages Project (auto-created on first deploy)

---

## 1️⃣ DNS CONFIGURATION

### Add Domain to Cloudflare

1. **Login to Cloudflare:** https://dash.cloudflare.com
2. **Add Site:**
   - Click "Add a site"
   - Enter: `k2spiceshop.com`
   - Choose Free plan (sufficient for e-commerce)
   - Click "Continue"

3. **Update Nameservers** (at your domain registrar):
   - Cloudflare will provide 2 nameservers, e.g.:
     - `luke.ns.cloudflare.com`
     - `nancy.ns.cloudflare.com`
   - Log in to your domain registrar (GoDaddy, Namecheap, etc.)
   - Replace their nameservers with Cloudflare's
   - Wait 24-48 hours for propagation

### DNS Records to Add

| Type | Name | Content | TTL | Status |
|------|------|---------|-----|--------|
| CNAME | k2spiceshop.com | yourusername.pages.dev | Auto | Proxied (orange cloud) |
| CNAME | www | yourusername.pages.dev | Auto | Proxied (orange cloud) |

**How to add:**
1. Go to DNS → Records (left sidebar)
2. Click "+ Add record"
3. Set Type: CNAME
4. Name: `k2spiceshop.com` or `www`
5. Target: (Cloudflare will provide after Pages project created)
6. TTL: Auto
7. Proxy: ON (orange cloud icon)

---

## 2️⃣ SSL/TLS SETTINGS

### Configure HTTPS

1. **Go to:** SSL/TLS (left sidebar)

2. **Choose Encryption Level:**
   - Set to: **Full (strict)**
   - This ensures HTTPS between Cloudflare and origin

3. **Always Use HTTPS:**
   - Go to: SSL/TLS → Edge Certificates → Automatic HTTPS Rewrites
   - Turn ON: "Always Use HTTPS"
   - This redirects all HTTP to HTTPS

4. **Minimum TLS Version:**
   - Set to: **TLS 1.2**
   - Ensures modern encryption standards

5. **Disable TLS Client Auth:**
   - Leave OFF (unless you need client certificates)

### Certificate Configuration

- **Managed Certificate:** Cloudflare auto-renews
- **Custom Certificate:** Not needed for this setup
- **Status:** Check "Certificates" tab to verify active certificate

---

## 3️⃣ PERFORMANCE & CACHING

### Cache Configuration

1. **Go to:** Caching → Configuration

2. **Browser Cache TTL:**
   ```
   Set to: 1 month (2592000 seconds)
   ```
   - Browser caches static assets for faster repeat visits

3. **Cache Level:**
   - Set to: **Cache Everything**
   - Ensures all static pages cached

4. **Cache Rules** (Caching → Cache Rules):

Create these rules:

**Rule 1: Cache Forever (Static Assets)**
```
Path: /_astro/*
   ├─ Cache Key: Cache Level → Cache Everything
   ├─ Browser TTL → 1 month
   └─ Cache Standard Time to Live (TTL) → 1 month
```

**Rule 2: No Cache (HTML Pages)**
```
Path: /*.html or /*/
   ├─ Cache Level → Bypass Cache
   └─ Browser Cache TTL → 1 hour
```

**Rule 3: No Cache (Cart & Checkout)**
```
Path: /carrito/* or /checkout/* or /confirmation/*
   ├─ Cache Level → Bypass Cache
   └─ Browser Cache TTL → Do Not Cache
```

### Image Optimization

1. **Go to:** Speed → Optimization

2. **Image Optimization:**
   - Turn ON: "Polish"
   - Set to: **Lossless** (or Lossy for max compression)

3. **Responsive Images:**
   - Turn ON: "Mirage"
   - Auto-serves optimized images based on device

4. **Rocket Loader:**
   - Set to: **Defer JavaScript**
   - Defers non-critical JS loading

### Minification

1. **Go to:** Speed → Optimization

2. **Minification:**
   - Turn ON all three:
     - ✓ Minify JavaScript
     - ✓ Minify CSS
     - ✓ Minify HTML

---

## 4️⃣ SECURITY SETTINGS

### DDoS Protection

1. **Go to:** Security → DDoS Protection

2. **Sensitivity Level:**
   - Set to: **Medium** (balanced for e-commerce)
   - Blocks obvious attacks; allows legitimate traffic

3. **Advanced DDoS:**
   - Leave ON (default)
   - Automatically detects and mitigates DDoS

### Bot Management

1. **Go to:** Security → Bots

2. **Super Bot Fight Mode:**
   - Turn ON
   - Verified Bots: **Allow**
   - Challenged Bots: **Block**
   - Definitely Automated: **Block**

This blocks bad bots while allowing Google, Bing, etc.

### Web Application Firewall (WAF)

1. **Go to:** Security → WAF

2. **OWASP ModSecurity Core Rule Set:**
   - Set to: **On (default sensitivity)**
   - Protects against common web attacks

3. **Managed Rulesets:**
   - Turn ON: "Cloudflare Managed Ruleset"
   - Turn ON: "OWASP Managed Ruleset"

### Rate Limiting

1. **Go to:** Security → Rate Limiting

2. **Create Rule:**
```
Path: /api/* (if you add API routes)
├─ Threshold: 100 requests per 10 seconds
├─ Action: Block
└─ Duration: 60 seconds
```

For cart/checkout (be lenient):
```
Path: /checkout/*
├─ Threshold: 50 requests per minute
├─ Action: Challenge (require CAPTCHA)
└─ Duration: 60 seconds
```

---

## 5️⃣ CONTENT DELIVERY & COMPRESSION

### Compression

1. **Go to:** Speed → Optimization

2. **Brotli Compression:**
   - Turn ON
   - Real-time compression for faster delivery

3. **Gzip Compression:**
   - Leave ON (default)

### Early Hints

1. **Go to:** Speed → Optimization

2. **Early Hints:**
   - Turn ON (experimental but beneficial)
   - Sends preload hints to browsers

---

## 6️⃣ RULES & REDIRECTS

### Create Redirect Rules

1. **Go to:** Rules → Redirect Rules

2. **Rule 1: Redirect www to non-www** (optional)
```
If: Hostname equals www.k2spiceshop.com
Then: Redirect to https://k2spiceshop.com
      Status code: 301 (Permanent)
```

Or vice versa if you prefer www subdomain.

3. **Rule 2: Security Headers**
```
Go to: Rules → Origin Rules
If: Request URL path contains *
Then: Add headers:
  ├─ X-Frame-Options: SAMEORIGIN
  ├─ X-Content-Type-Options: nosniff
  └─ X-XSS-Protection: 1; mode=block
```

---

## 7️⃣ PAGE RULES (If on Pro Plan)

If you upgrade to Pro, add:

1. **Cache Everything on Specific Paths:**
```
Pattern: k2spiceshop.com/blog/*
├─ Cache Level: Cache Everything
├─ Browser Cache TTL: 1 month
└─ Cache TTL: 1 month
```

2. **No Cache for Dynamic Content:**
```
Pattern: k2spiceshop.com/api/*
├─ Cache Level: Bypass Cache
└─ Browser Cache TTL: 0
```

---

## 8️⃣ ANALYTICS & MONITORING

### Cloudflare Analytics Engine

1. **Go to:** Analytics & Reports

2. **Dashboard Views:**
   - ✓ View Traffic Summary
   - ✓ View Security Overview
   - ✓ View Performance Metrics

### Key Metrics to Monitor

| Metric | Target | Action |
|--------|--------|--------|
| Requests per second | Baseline | Monitor growth |
| Cache hit ratio | >80% | Adjust cache rules if low |
| Origin response time | <500ms | Check Astro server |
| SSL grade | A+ | Verify SSL settings |
| Page load time | <2s | Optimize if needed |
| DDoS attacks blocked | 0 | Alert if spike |
| Bot traffic | <10% | Monitor bot rules |

---

## 9️⃣ EMAIL ROUTING (Optional)

For support emails (optional feature):

1. **Go to:** Email → Email Routing

2. **Create Rule:**
```
From: support@k2spiceshop.com
To: your-personal-email@gmail.com
```

3. **Enable:**
   - Automatically forward support emails to your inbox

---

## 🔟 WORKERS (If You Add Backend Logic)

If you later add Cloudflare Workers for backend:

1. **Go to:** Workers & Pages

2. **Create Worker Routes:**
```
Route: k2spiceshop.com/api/*
Worker: your-worker-name
```

3. **Environment Variables:**
   - Set any API keys, database URLs, etc.

---

## 1️⃣1️⃣ FIREWALL RULES (Advanced Security)

### Create Custom Rules

1. **Go to:** Security → WAF → Firewall Rules → Create Rule

2. **Rule 1: Block Suspicious User Agents**
```
Expression: (cf.bot_category eq "Scanner") or (cf.bot_category eq "Crawler")
Action: Block
```

3. **Rule 2: Challenge on Suspicious Pattern**
```
Expression: (http.request.uri.query contains "union") or (http.request.uri.query contains "select")
Action: Challenge
```

---

## 1️⃣2️⃣ OPTIMIZATION CHECKLIST

- [ ] Domain added to Cloudflare
- [ ] Nameservers updated at registrar
- [ ] DNS records created (CNAME for Pages)
- [ ] SSL/TLS set to Full (Strict)
- [ ] Always Use HTTPS enabled
- [ ] Cache Level set to Cache Everything
- [ ] Browser Cache TTL set to 1 month
- [ ] Polish/Mirage image optimization ON
- [ ] Minification ON (CSS, JS, HTML)
- [ ] Super Bot Fight Mode ON
- [ ] WAF/DDoS Protection enabled
- [ ] Brotli compression ON
- [ ] Analytics dashboard accessed
- [ ] Cache Rules configured for static/dynamic content
- [ ] Rate limiting set for API routes
- [ ] Firewall rules created for security

---

## 1️⃣3️⃣ MONITORING AFTER SETUP

### Daily/Weekly

1. Check Analytics Dashboard
   - Any unusual traffic patterns
   - Cache hit ratio staying >80%
   - Page load times consistent

2. Security Check
   - Review blocked requests in WAF
   - Check if any DDoS activity
   - Verify bot traffic is low

### Monthly

1. Performance Review
   - Lighthouse scores
   - Core Web Vitals
   - Origin response times

2. Cost Review
   - Bandwidth usage
   - Number of requests
   - Any rate limit hits

---

## 1️⃣4️⃣ PERFORMANCE TARGETS

After configuration, aim for:

```
Page Load Time:      < 2 seconds (mobile)
Cache Hit Ratio:     > 80%
Time to First Byte:  < 500ms
SSL Grade:           A+ or A
Uptime/Availability: 99.9%
DDoS Attacks Blocked: >99.9%
```

---

## 1️⃣5️⃣ TROUBLESHOOTING

### High Origin Load (99% bandwidth from origin)

**Solution:**
1. Increase Browser Cache TTL
2. Check Cache Level (should be "Cache Everything")
3. Add specific Cache Rules for /product/* and /blog/*
4. Enable Polish for image optimization

### Slow Page Loads

**Solution:**
1. Check origin response time (Astro build time)
2. Enable Rocket Loader for JS
3. Increase minification
4. Verify Polish/Mirage enabled

### Too Many 5xx Errors

**Solution:**
1. Check Astro site is deployed correctly
2. Verify GitHub Actions build succeeded
3. Check Cloudflare Pages deployment logs
4. Review origin error logs

### High DDoS Blocks (More than expected)

**Solution:**
1. Reduce DDoS sensitivity to Low
2. Review WAF rules that might be too strict
3. Add Whitelist rule for your IP addresses
4. Check for legitimate bot traffic being blocked

---

## 1️⃣6️⃣ ESTIMATED PERFORMANCE IMPROVEMENT

After implementing all settings:

| Metric | Before | After | Improvement |
|--------|--------|-------|-------------|
| Page Load Time | 3-4s | 1-2s | 50-75% faster |
| Cache Hit Ratio | 30% | 85% | 185% better |
| Bandwidth Usage | 100% | 20% | 80% reduction |
| Time to First Byte | 800ms | 200ms | 75% faster |

---

## 📞 SUPPORT & RESOURCES

- **Cloudflare Docs:** https://developers.cloudflare.com/
- **Pages Setup:** https://developers.cloudflare.com/pages/get-started/
- **Caching Rules:** https://developers.cloudflare.com/cache/
- **Security Best Practices:** https://developers.cloudflare.com/security/

---

## 🎯 QUICK SETUP ORDER

1. ✅ Add domain to Cloudflare
2. ✅ Update nameservers (24-48 hours wait)
3. ✅ Configure SSL/TLS
4. ✅ Set cache rules
5. ✅ Enable security (DDoS, WAF, Bots)
6. ✅ Enable compression & optimization
7. ✅ Monitor analytics
8. ✅ Fine-tune based on metrics

**Estimated Setup Time:** 30 minutes
**Expected Benefit:** 50-75% faster pages, 80% less bandwidth usage

