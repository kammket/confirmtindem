# Cloudflare Pages Quick Start Deployment

Deploy your k2spiceshop site to production in 5 minutes! This guide covers the essential steps.

## ⚡ Quick Setup (5 minutes)

### Step 1: Prepare Your GitHub Repository

```bash
cd /Users/edwin/Documents/confirmtindem/confirmtindem/astro-ecommerce

# Initialize Git if not already done
git init
git add .
git commit -m "Initial commit: Astro e-commerce site with Cloudflare Pages config"

# Add your GitHub remote (replace with your repo URL)
git remote add origin https://github.com/YOUR_USERNAME/k2spiceshop.git
git branch -M main
git push -u origin main
```

### Step 2: Create Cloudflare API Token

1. Go to: https://dash.cloudflare.com
2. Click your profile icon → **API Tokens**
3. Click **Create Token**
4. Select template: **"Edit Cloudflare Pages"**
5. Grant minimum permissions:
   - Account.Pages: Edit
   - Account.Cloudflare Pages: Edit
6. Copy the token and save it

### Step 3: Find Your Cloudflare Account ID

1. Log in to https://dash.cloudflare.com
2. Your Account ID is displayed in:
   - Dashboard main page (right sidebar)
   - Or visible in URL when viewing a domain

### Step 4: Add GitHub Secrets

1. Go to your GitHub repository
2. Navigate: **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**:
   - **Name:** `CLOUDFLARE_API_TOKEN`
   - **Value:** [Paste your token from Step 2]
4. Click **New repository secret** again:
   - **Name:** `CLOUDFLARE_ACCOUNT_ID`
   - **Value:** [Paste your Account ID from Step 3]

### Step 5: Deploy (Automatic)

Make a small change and push:

```bash
git add .
git commit -m "Trigger deployment"
git push origin main
```

Go to **GitHub Actions** tab in your repository to monitor the build and deployment.

### Step 6: Configure Domain (After First Deployment)

1. In Cloudflare, go: **Pages** → **k2spiceshop** → **Settings** → **Domains**
2. Click **Add custom domain**
3. Enter: `k2spiceshop.com`
4. Follow DNS configuration steps

## 🎯 Key Files Created

```
.github/workflows/deploy.yml      # GitHub Actions workflow
wrangler.toml                      # Cloudflare Pages config
setup-cloudflare.sh                # Setup helper script
CLOUDFLARE_DEPLOYMENT.md           # Full deployment guide
```

## 🔄 Deployment Process

```
git push origin main
    ↓
GitHub Actions triggered
    ↓
Install dependencies (npm ci)
    ↓
Build site (npm run build)
    ↓
Deploy to Cloudflare Pages (dist folder)
    ↓
Site live at k2spiceshop.com
```

## 📊 What Gets Deployed

- **Source:** Everything in `/dist` folder after build
- **Build Output:** Generated static HTML, CSS, JS
- **Assets:** Images, fonts, all static files
- **Pages:** All 27+ pages (product pages, cart, checkout, legal pages)

## ✅ Verify Deployment

1. **In GitHub:**
   - Go to **Actions** tab
   - Watch workflow run
   - Look for green checkmark ✓

2. **In Cloudflare:**
   - Go to: https://dash.cloudflare.com
   - Pages → k2spiceshop
   - View deployment history
   - Check deployment logs for errors

3. **Live Site:**
   - Visit: https://k2spiceshop.com (once domain is configured)
   - Or use Cloudflare Pages subdomain

## 🐛 Troubleshooting

| Issue | Solution |
|-------|----------|
| Build fails in GitHub Actions | Check Actions tab for error logs. Verify `npm run build` works locally |
| Secrets not found error | Ensure CLOUDFLARE_API_TOKEN and CLOUDFLARE_ACCOUNT_ID are set in repo settings |
| Pages project not created | Cloudflare Pages project is auto-created on first deployment OR create in dashboard manually |
| Domain shows 404 | Wait for DNS to propagate (up to 48hrs). Clear Cloudflare cache |
| Site not updating | Clear browser cache and Cloudflare cache (Dashboard → Caching → Purge Cache) |

## 🚀 Future Deployments

Now that it's set up, just push code to GitHub:

```bash
git add .
git commit -m "Update product description"
git push origin main
```

Your site automatically deploys! No manual steps needed.

## 🔐 Security Best Practices

✓ API Token never exposed in code (stored in GitHub Secrets)
✓ All deployments are over HTTPS
✓ Cloudflare provides free SSL/TLS certificates
✓ DDoS protection enabled by default
✓ Code never pushed to Cloudflare, only build output

## 📖 Full Documentation

For complete setup details, configuration options, and troubleshooting, see:
→ [CLOUDFLARE_DEPLOYMENT.md](./CLOUDFLARE_DEPLOYMENT.md)

## 🎓 Learn More

- **Cloudflare Pages:** https://developers.cloudflare.com/pages/
- **Astro Deployment:** https://docs.astro.build/guides/deploy/cloudflare/
- **GitHub Actions:** https://docs.github.com/actions

---

**Questions?** Check the full deployment guide or Cloudflare documentation.

