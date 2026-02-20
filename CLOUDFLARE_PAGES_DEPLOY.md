# Deploy to Cloudflare Pages - Simple Guide

Just the essential steps to get your site live.

## 1. Create Cloudflare Account

1. Go to https://dash.cloudflare.com
2. Sign up with email
3. Verify email

## 2. Get Your Credentials

### API Token

1. Go to https://dash.cloudflare.com/profile/api-tokens
2. Click **Create Token**
3. Use template: **"Edit Cloudflare Pages"**
4. Click **Continue to summary**
5. Click **Create Token**
6. **Copy the token** (save it somewhere safe)

### Account ID

1. Go to https://dash.cloudflare.com
2. Look at the URL or find **Account ID** in the dashboard
3. Copy it

## 3. Add to GitHub Secrets

1. Go to your GitHub repo: https://github.com/kammket/confirmtindem
2. Go to **Settings** → **Secrets and variables** → **Actions**
3. Click **New repository secret**
4. Add:
   - **Name:** `CLOUDFLARE_API_TOKEN`
   - **Value:** [paste your token from step 2]
5. Click **Add secret**
6. Click **New repository secret** again
7. Add:
   - **Name:** `CLOUDFLARE_ACCOUNT_ID`
   - **Value:** [paste your Account ID from step 2]
8. Click **Add secret**

## 4. Deploy

Push any commit to GitHub and it automatically deploys:

```bash
git add .
git commit -m "Deploy to Cloudflare Pages"
git push origin main
```

Monitor deployment:
- Go to GitHub **Actions** tab
- Watch the workflow run
- Look for "Deploy to Cloudflare Pages" step

## 5. View Your Live Site

After successful deployment:

1. Go to https://dash.cloudflare.com
2. Click **Pages** (left sidebar)
3. Click your **k2spiceshop** project
4. Copy your Pages deployment URL
5. Visit the URL to see your live site

**Deployment URL format:** `yourusername.pages.dev`

## 6. Connect Your Domain (Optional)

To use k2spiceshop.com instead of the .pages.dev URL:

1. In Cloudflare Pages project → **Settings** → **Domains**
2. Click **Add custom domain**
3. Enter: `k2spiceshop.com`
4. Follow the DNS setup steps

**That's it!** 🚀

Every time you push to GitHub, your site automatically deploys to Cloudflare Pages.

