# GitHub Pages Deployment Guide

This directory contains the AI-Era Career Framework configured for GitHub Pages deployment.

## 🚀 Quick Deployment

Run the deployment script:
```bash
./deploy.sh
```

Then follow the instructions provided by the script.

## 📁 GitHub Pages Files

- `_config.yml` - Jekyll configuration for GitHub Pages
- `.github/workflows/deploy.yml` - GitHub Actions workflow for automatic deployment
- `Gemfile` - Ruby dependencies for Jekyll
- `index.md` - Homepage that introduces the framework
- `.gitignore` - Excludes build files and dependencies

## 🌐 Site Structure

When deployed, the site will have:
- **Homepage**: Introduction and quick navigation
- **Framework Documents**: All 11 markdown files accessible as web pages
- **Automatic Navigation**: Jekyll will generate site navigation
- **Mobile Responsive**: Clean, professional theme
- **SEO Optimized**: Meta tags and sitemap

## ⚙️ Manual Setup

If you prefer manual setup:

1. **Create GitHub Repository**
   ```bash
   # Create repository on GitHub, then:
   git remote add origin https://github.com/USERNAME/REPO_NAME.git
   git push -u origin main
   ```

2. **Enable GitHub Pages**
   - Go to repository Settings → Pages
   - Source: "GitHub Actions"
   - The workflow will automatically build and deploy

3. **Update Configuration**
   - Edit `_config.yml`
   - Update `url` and `baseurl` with your repository details
   - Update social media links if desired

4. **Access Your Site**
   - Site will be available at: `https://USERNAME.github.io/REPO_NAME`
   - Initial deployment takes 5-10 minutes

## 🎨 Customization

The framework uses the `minima` theme by default. You can customize:

- **Theme**: Change `theme` in `_config.yml`
- **Colors**: Add custom CSS in `assets/css/style.scss`
- **Layout**: Modify `_layouts` directory (create if needed)
- **Navigation**: Update `header_pages` in `_config.yml`

## 📱 Features

- ✅ Mobile responsive design
- ✅ Fast loading and optimized
- ✅ SEO friendly with meta tags
- ✅ Automatic sitemap generation
- ✅ RSS feed for updates
- ✅ Clean, professional appearance
- ✅ Easy navigation between documents
- ✅ Automatic deployment on updates

## 🔧 Local Development

To test locally:
```bash
bundle install
bundle exec jekyll serve
```

Site will be available at `http://localhost:4000`

## 📊 Analytics (Optional)

To add Google Analytics:
1. Add `google_analytics: "G-XXXXXXXXXX"` to `_config.yml`
2. Replace with your actual tracking ID

## 🤝 Contributing

The framework is designed to be easily updated:
1. Edit markdown files directly
2. Commit and push changes
3. GitHub Actions automatically rebuilds the site
4. Updates are live within minutes

---

**Ready to deploy your AI-Era Career Framework? Run `./deploy.sh` to get started!**
