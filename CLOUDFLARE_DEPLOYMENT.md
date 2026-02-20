# Cloudflare Pages Deployment Guide

This guide walks you through deploying your Astro e-commerce site to Cloudflare Pages using GitHub Actions for automated CI/CD.

## Prerequisites

- GitHub account and repository
- Cloudflare account (free or paid)
- Your domain (k2spiceshop.com) or a Cloudflare Pages subdomain

## Step 1: Set Up GitHub Repository

1. Push your local project to GitHub:
```bash
cd /Users/edwin/Documents/confirmtindem/confirmtindem/astro-ecommerce
git remote add origin https://github.com/YOUR_USERNAME/k2spiceshop.git
git branch -M main
git push -u origin main
```

2. Ensure your main/master branch is the default branch in GitHub settings

## Step 2: Create Cloudflare Account & Get Credentials

1. **Go to Cloudflare Dashboard:** https://dash.cloudflare.com
2. **Create API Token:**
   - Click on your profile icon → API Tokens
   - Click "Create Token"
   - Use template: "Edit Cloudflare Pages"
   - Grant permissions:
     - Account.Pages: Edit
     - Account.Cloudflare Pages: Edit
   - Copy the token and save it securely

3. **Find Your Account ID:**
   - In Cloudflare Dashboard, note your **Account ID** (visible in the URL or dashboard)
   - Format: usually a 32-character alphanumeric string

## Step 3: Configure GitHub Secrets

1. Go to your GitHub repository
2. Navigate to: **Settings → Secrets and variables → Actions**
3. Click **New repository secret** and add:
   - **Name:** `CLOUDFLARE_API_TOKEN`
   - **Value:** Your API token from Step 2
4. Click **New repository secret** again and add:
   - **Name:** `CLOUDFLARE_ACCOUNT_ID`
   - **Value:** Your Account ID from Step 2

## Step 4: Create Cloudflare Pages Project (Manual Setup)

### Option A: Via Cloudflare Dashboard (Recommended for First Setup)

1. Log in to Cloudflare Dashboard
2. Under "Workers & Pages", click **Pages**
3. Click **Create a project**
4. Select **Connect to Git**
5. Choose your GitHub repository
6. Configure build settings:
   - **Framework preset:** Astro
   - **Build command:** `npm run build`
   - **Build output directory:** `dist`
   - **Root directory:** `/` (leave blank)
7. Set environment variables (if needed):
   - Add any environment variables your site needs
8. Click **Save and Deploy**

### Option B: Via GitHub Actions (Automated)

The `.github/workflows/deploy.yml` file handles this automatically when you push to GitHub.

## Step 5: Deploy Your Site

### Automatic Deployment (Recommended)

1. Make changes to your code locally
2. Commit and push to GitHub:
```bash
git add .
git commit -m "Update site content"
git push origin main
```

3. GitHub Actions will automatically:
   - Build your Astro project
   - Run tests (if configured)
   - Deploy to Cloudflare Pages

4. Monitor deployment in GitHub:
   - Go to **Actions** tab in your repository
   - Watch the workflow run in real-time
   - Check for successful deployment message

### Manual Deployment

If you need to deploy manually without Git, you can use Wrangler CLI:

```bash
# Install Wrangler globally
npm install -g @cloudflare/wrangler

# Authenticate with Cloudflare
wrangler login

# Deploy the dist folder
wrangler pages deploy dist --project-name k2spiceshop
```

## Step 6: Connect Your Domain

1. In Cloudflare Dashboard, go to your **Pages project**
2. Navigate to **Settings → Domains**
3. Click **Add custom domain**
4. Enter: `k2spiceshop.com`
5. Follow the prompts to verify domain ownership

### If Using Cloudflare for DNS:

1. Add DNS records in Cloudflare for k2spiceshop.com pointing to your Pages project
2. Typically, Cloudflare will handle this automatically

### If Using Another DNS Provider:

1. Point your domain's nameservers to Cloudflare
2. Or configure CNAME record as Cloudflare instructs

## Step 7: SSL/HTTPS Configuration

Cloudflare Pages provides **free SSL/TLS certificates**:
- All deployments are automatically HTTPS
- Certificates are managed by Cloudflare
- No additional configuration needed

## Step 8: Configure Cloudflare Settings (Optional)

In Cloudflare Dashboard for your domain:

### Caching Rules
- **Static assets** (images, CSS, JS): Cache aggressively (1 month)
- **HTML files**: Cache short term (1 hour) or bypass cache
- **API routes** (if added): Bypass cache

### Page Rules (if on paid plan)
- Set cache level and TTL for specific paths
- Configure security settings

### Workers (if needed for dynamic functionality)
- Use Cloudflare Workers for server-side logic
- Configure routes: `/api/*` → Worker script

## Step 9: Environment Variables (If Needed)

If your site needs environment variables:

1. In GitHub repository secrets, add variables like:
   - `SITE_URL=https://k2spiceshop.com`
   - `API_KEY=your-key`

2. Update `.github/workflows/deploy.yml`:
```yaml
- name: Build site
  run: npm run build
  env:
    SITE_URL: ${{ secrets.SITE_URL }}
    API_KEY: ${{ secrets.API_KEY }}
```

3. Or configure directly in Cloudflare Pages project settings

## Step 10: Monitoring & Analytics

In Cloudflare Dashboard:

1. **Analytics:** View traffic, requests, cache stats
2. **Logs:** Check deployment logs for errors
3. **Performance:** Monitor Core Web Vitals
4. **Security:** Review DDoS protection, bot management

## Troubleshooting

### Build Fails in GitHub Actions

1. Check the Actions tab for error logs
2. Common issues:
   - Node version mismatch: Update in `.github/workflows/deploy.yml`
   - Missing dependencies: Run `npm ci` locally and commit `package-lock.json`
   - Environment variables: Ensure secrets are set correctly

### Deployment Fails in Cloudflare

1. Verify build command produces `dist` folder
2. Check project name matches in workflow file
3. Verify API token has correct permissions
4. Check account ID is correct

### Domain Not Resolving

1. Verify domain is added in Cloudflare Pages settings
2. Check DNS configuration is complete
3. Wait up to 48 hours for DNS propagation
4. Use `dig` or `nslookup` to verify DNS records

### Site Shows 404

1. Check that build output directory is `dist`
2. Verify all pages are being built
3. Clear Cloudflare cache:
   - Dashboard → Caching → Cache Rules → Purge Everything

## Production Checklist

Before going live with k2spiceshop.com:

- [ ] Domain configured in Cloudflare Pages
- [ ] SSL/HTTPS working without warnings
- [ ] All pages building successfully
- [ ] GitHub Actions workflow passing
- [ ] Environment variables set (if any)
- [ ] Analytics/Monitoring configured
- [ ] Performance optimized (Lighthouse score 90+)
- [ ] Security headers configured
- [ ] Sitemap and robots.txt accessible
- [ ] Email contact form working
- [ ] Cart functionality tested end-to-end
- [ ] Mobile responsiveness verified
- [ ] SEO meta tags present
- [ ] Backup DNS records (if needed)

## Deployment Frequency

With this setup:
- **Development:** Push to different branches (dev, staging)
- **Production:** Push to `main` branch
- **Hotfixes:** Create branches → PR → merge to main
- **Automatic:** Every merge to main triggers deployment

## Rollback Procedure

If you need to revert a deployment:

1. Cloudflare Pages keeps last 100 deployments
2. Go to Pages project → Deployments
3. Select previous successful deployment
4. Click **Rollback** or **View**
5. Redeploy if needed

Or revert in Git and push:
```bash
git revert <commit-hash>
git push origin main
```

## Next Steps

1. Initialize Git in your project (if not done):
```bash
git init
git add .
git commit -m "Initial commit"
```

2. Create GitHub repository and push code

3. Set up API token and account ID as GitHub secrets

4. Configure Cloudflare Pages project

5. Connect your domain

6. Test the deployment workflow by making a small change and pushing to GitHub

## Support

- **Cloudflare Docs:** https://developers.cloudflare.com/pages/
- **Astro Deployment:** https://docs.astro.build/guides/deploy/
- **GitHub Actions:** https://docs.github.com/actions

