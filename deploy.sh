#!/bin/bash

# AI-Era Career Framework - GitHub Pages Deployment Script
# This script helps set up and deploy the framework to GitHub Pages

echo "🚀 AI-Era Career Framework - GitHub Pages Deployment"
echo "=================================================="

# Check if we're in a git repository
if [ ! -d ".git" ]; then
    echo "❌ Error: This is not a git repository. Please run 'git init' first."
    exit 1
fi

# Check if README.md exists (main framework file)
if [ ! -f "README.md" ]; then
    echo "❌ Error: README.md not found. Are you in the correct directory?"
    exit 1
fi

echo "✅ Git repository detected"
echo "✅ Framework files found"

# Add all files to git
echo "📝 Adding files to git..."
git add .

# Check for changes
if git diff --staged --quiet; then
    echo "ℹ️  No changes to commit"
else
    # Commit changes
    echo "📝 Committing changes..."
    git commit -m "Deploy AI-Era Career Framework to GitHub Pages

- Added Jekyll configuration (_config.yml)
- Added GitHub Actions workflow for automatic deployment
- Added Gemfile for dependencies
- Created index.md homepage
- Updated documentation for web deployment
- Added .gitignore for Jekyll build files

Framework ready for GitHub Pages deployment."
fi

echo ""
echo "🎯 Next Steps for GitHub Pages Deployment:"
echo "=========================================="
echo ""
echo "1. Create a new repository on GitHub:"
echo "   - Go to https://github.com/new"
echo "   - Name: 'ai-era-career-framework' (or your preferred name)"
echo "   - Make it public for GitHub Pages"
echo "   - Don't initialize with README (we already have one)"
echo ""
echo "2. Connect your local repository to GitHub:"
echo "   git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git"
echo "   git branch -M main"
echo "   git push -u origin main"
echo ""
echo "3. Enable GitHub Pages:"
echo "   - Go to your repository settings"
echo "   - Scroll to 'Pages' section"
echo "   - Source: 'GitHub Actions'"
echo "   - The workflow will automatically deploy your site"
echo ""
echo "4. Your site will be available at:"
echo "   https://YOUR_USERNAME.github.io/REPO_NAME"
echo ""
echo "5. Update _config.yml with your actual GitHub username and repo name"
echo ""
echo "📚 Framework Structure:"
echo "- 🏠 Homepage: index.md (redirects to main content)"
echo "- 📖 Main Hub: README.md"  
echo "- 🗺️  Study Guide: 00-STUDY-GUIDE.md"
echo "- 📋 Master Index: 01-MASTER-INDEX.md"
echo "- ⚡ Quick Reference: QUICK-REFERENCE.md"
echo "- 📚 Core Documents: 02-10 (sequential learning path)"
echo ""
echo "🎉 Your AI-Era Career Framework is ready for deployment!"
