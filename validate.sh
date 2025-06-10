#!/bin/bash

# AI-Era Career Framework - Deployment Validation Script
# Checks that all files are properly configured for GitHub Pages

echo "🔍 AI-Era Career Framework - Deployment Validation"
echo "================================================="

# Color codes for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Track validation status
validation_passed=true

echo ""
echo "📁 Checking required files..."

# Check for required Jekyll files
required_files=("_config.yml" "Gemfile" "index.md" ".github/workflows/deploy.yml")
for file in "${required_files[@]}"; do
    if [ -f "$file" ]; then
        echo -e "✅ ${GREEN}$file${NC} - Found"
    else
        echo -e "❌ ${RED}$file${NC} - Missing"
        validation_passed=false
    fi
done

echo ""
echo "📚 Checking framework documents..."

# Check for numbered documents
numbered_docs=("00-STUDY-GUIDE.md" "01-MASTER-INDEX.md" "02-Skills-Assessment-Tracker.md" "03-AI-Era-Developer-Resilience-Framework.md" "04-90-Day-Action-Plan.md" "05-Essential-Resources-Guide.md" "06-Work-Integrated-Learning-Guide.md" "07-Market-Intelligence-Guide.md" "08-Emerging-Tech-Career-Expansion.md" "09-Crisis-Response-Playbook.md" "10-AI-Era-Developer-Career-Guide.md")

for doc in "${numbered_docs[@]}"; do
    if [ -f "$doc" ]; then
        echo -e "✅ ${GREEN}$doc${NC} - Found"
    else
        echo -e "❌ ${RED}$doc${NC} - Missing"
        validation_passed=false
    fi
done

# Check for core documents
core_docs=("README.md" "QUICK-REFERENCE.md")
for doc in "${core_docs[@]}"; do
    if [ -f "$doc" ]; then
        echo -e "✅ ${GREEN}$doc${NC} - Found"
    else
        echo -e "❌ ${RED}$doc${NC} - Missing"
        validation_passed=false
    fi
done

echo ""
echo "🔧 Checking git configuration..."

# Check git status
if git rev-parse --git-dir > /dev/null 2>&1; then
    echo -e "✅ ${GREEN}Git repository${NC} - Initialized"
    
    # Check if files are committed
    if git diff-index --quiet HEAD --; then
        echo -e "✅ ${GREEN}All changes committed${NC}"
    else
        echo -e "⚠️  ${YELLOW}Uncommitted changes detected${NC}"
        echo "   Run 'git add . && git commit -m \"Update framework\"' to commit changes"
    fi
    
    # Check for remote
    if git remote get-url origin > /dev/null 2>&1; then
        remote_url=$(git remote get-url origin)
        echo -e "✅ ${GREEN}Remote origin set${NC} - $remote_url"
    else
        echo -e "⚠️  ${YELLOW}No remote origin set${NC}"
        echo "   Set up GitHub repository and add remote with:"
        echo "   git remote add origin https://github.com/USERNAME/REPO_NAME.git"
    fi
else
    echo -e "❌ ${RED}Not a git repository${NC}"
    validation_passed=false
fi

echo ""
echo "📝 Checking front matter in key documents..."

# Check for front matter in key files
front_matter_files=("index.md" "00-STUDY-GUIDE.md" "01-MASTER-INDEX.md" "QUICK-REFERENCE.md" "README.md")
for file in "${front_matter_files[@]}"; do
    if [ -f "$file" ]; then
        if grep -q "^---" "$file"; then
            echo -e "✅ ${GREEN}$file${NC} - Has front matter"
        else
            echo -e "⚠️  ${YELLOW}$file${NC} - Missing front matter (optional)"
        fi
    fi
done

echo ""
echo "🌐 Framework structure validation..."

# Count total markdown files
total_md_files=$(ls -1 *.md 2>/dev/null | wc -l)
expected_files=16  # All numbered docs + core docs + new docs

if [ "$total_md_files" -ge 13 ]; then
    echo -e "✅ ${GREEN}Framework complete${NC} - $total_md_files markdown files found"
else
    echo -e "⚠️  ${YELLOW}Framework incomplete${NC} - Only $total_md_files files found (expected 13+)"
fi

echo ""
echo "📊 Validation Summary"
echo "===================="

if [ "$validation_passed" = true ]; then
    echo -e "🎉 ${GREEN}VALIDATION PASSED!${NC}"
    echo ""
    echo "Your AI-Era Career Framework is ready for GitHub Pages deployment!"
    echo ""
    echo "Next steps:"
    echo "1. Create GitHub repository (public)"
    echo "2. git remote add origin https://github.com/USERNAME/REPO_NAME.git"
    echo "3. git push -u origin main"
    echo "4. Enable GitHub Pages in repository settings"
    echo ""
    echo "📖 See DEPLOYMENT_READY.md for detailed instructions"
else
    echo -e "⚠️  ${YELLOW}VALIDATION ISSUES DETECTED${NC}"
    echo ""
    echo "Please fix the issues above before deploying to GitHub Pages."
    echo "Run this script again after making corrections."
fi

echo ""
echo "🔗 Useful files:"
echo "- DEPLOYMENT_READY.md - Complete deployment guide"
echo "- GITHUB_PAGES.md - Technical setup details"
echo "- _config.yml - Jekyll configuration"
echo ""
