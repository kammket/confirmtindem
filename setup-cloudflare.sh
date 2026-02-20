#!/bin/bash
# Cloudflare Pages Deployment Setup Script
# This script helps configure your k2spiceshop project for Cloudflare Pages deployment

set -e

echo "🚀 k2spiceshop - Cloudflare Pages Deployment Setup"
echo "=================================================="
echo ""

# Check if Git is initialized
if [ ! -d .git ]; then
    echo "📦 Initializing Git repository..."
    git init
    echo "✓ Git repository initialized"
else
    echo "✓ Git repository already exists"
fi

# Check if GitHub remote is configured
if ! git remote get-url origin &> /dev/null; then
    echo ""
    echo "⚠️  GitHub remote not configured"
    read -p "Enter your GitHub repository URL (https://github.com/username/repo.git): " GITHUB_URL
    git remote add origin "$GITHUB_URL"
    echo "✓ GitHub remote added"
else
    echo "✓ GitHub remote already configured"
fi

# Check for required files
echo ""
echo "📋 Checking configuration files..."

if [ -f .github/workflows/deploy.yml ]; then
    echo "✓ GitHub Actions workflow found"
else
    echo "✓ GitHub Actions workflow will be created"
fi

if [ -f wrangler.toml ]; then
    echo "✓ Wrangler configuration found"
else
    echo "✓ Wrangler configuration will be created"
fi

echo ""
echo "📝 Next Steps:"
echo "=============="
echo ""
echo "1️⃣  Push your code to GitHub:"
echo "   git add ."
echo "   git commit -m 'Add Cloudflare Pages configuration'"
echo "   git push -u origin main"
echo ""
echo "2️⃣  Create GitHub Secrets:"
echo "   - Go to GitHub repository → Settings → Secrets and variables → Actions"
echo "   - Add CLOUDFLARE_API_TOKEN"
echo "   - Add CLOUDFLARE_ACCOUNT_ID"
echo ""
echo "3️⃣  Get Cloudflare Credentials:"
echo "   - Visit: https://dash.cloudflare.com"
echo "   - Create API Token: API Tokens → Create Token"
echo "   - Use template: 'Edit Cloudflare Pages'"
echo "   - Find Account ID in dashboard URL or account page"
echo ""
echo "4️⃣  Configure Cloudflare Pages Project:"
echo "   Option A (Automatic): Workflow will handle it when you push"
echo "   Option B (Manual): https://dash.cloudflare.com → Pages → Create project"
echo ""
echo "5️⃣  Connect Your Domain:"
echo "   - Pages project → Settings → Domains"
echo "   - Add k2spiceshop.com"
echo "   - Configure DNS records"
echo ""
echo "6️⃣  Monitor Deployment:"
echo "   - GitHub: Actions tab to view workflow runs"
echo "   - Cloudflare: Pages project to view deployments"
echo ""
echo "📚 Full guide: See CLOUDFLARE_DEPLOYMENT.md"
echo ""
echo "✨ Setup complete! Push your code to GitHub to start deploying."
