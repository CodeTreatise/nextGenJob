# Git Multi-Account Setup Guide

## Current Setup
Your current global config has:
- Email: shivprasad.murgude@shauryatechnosoft.com  
- Name: shivprasad
- Credential helpers configured for Azure DevOps and company Git

## Setting Up Multiple Git Accounts

### Option 1: Conditional Includes (Recommended)
Create separate config files for different accounts and use conditional includes.

#### Step 1: Create config files for each account

**~/.gitconfig-work** (Current work account):
```
[user]
    email = shivprasad.murgude@shauryatechnosoft.com
    name = shivprasad
[credential "https://dev.azure.com"]
    useHttpPath = true
[credential "https://git.shauryatechnosoft.com"]
    provider = generic
```

**~/.gitconfig-github** (GitHub personal):
```
[user]
    email = your-github-email@gmail.com
    name = stpl-shivprasad
[credential "https://github.com"]
    helper = store
```

**~/.gitconfig-personal** (Other personal projects):
```
[user]
    email = your-personal-email@gmail.com
    name = shivprasad
```

#### Step 2: Update main ~/.gitconfig with conditional includes

```
[user]
    email = shivprasad.murgude@shauryatechnosoft.com
    name = shivprasad

[credential]
    credentialStore = secretservice
    helper = store

# Work projects (default)
[credential "https://dev.azure.com"]
    useHttpPath = true
[credential "https://git.shauryatechnosoft.com"]
    provider = generic

# Conditional includes based on directory
[includeIf "gitdir:~/Documents/Work/"]
    path = ~/.gitconfig-work

[includeIf "gitdir:~/Documents/Personal/"]
    path = ~/.gitconfig-personal

[includeIf "gitdir:~/Documents/GitHub/"]
    path = ~/.gitconfig-github

# Or include based on repository URL
[includeIf "hasconfig:remote.*.url:https://github.com/**"]
    path = ~/.gitconfig-github
```

### Option 2: Directory-Based Setup
Organize your projects by directories and use conditional includes:

```
~/Documents/Work/           -> Work email
~/Documents/Personal/       -> Personal email  
~/Documents/GitHub/         -> GitHub email
~/Documents/OpenSource/     -> GitHub email
```

### Option 3: Repository-Based Override
For specific repos, set local config:
```bash
cd /path/to/specific/repo
git config user.email "specific-email@example.com"
git config user.name "Specific Name"
```

## For This Project (AI-Era Career Framework)

Since this appears to be a personal/GitHub project, you should either:

1. **Move to GitHub directory structure**:
   ```bash
   mkdir -p ~/Documents/GitHub
   mv /home/shivprasad/Documents/Work/Learning/JOb ~/Documents/GitHub/ai-era-career-framework
   ```

2. **Set local config for this repo**:
   ```bash
   git config user.email "your-github-email@gmail.com"
   git config user.name "stpl-shivprasad"
   ```

3. **Use conditional include for this specific path**:
   Add to ~/.gitconfig:
   ```
   [includeIf "gitdir:/home/shivprasad/Documents/Work/Learning/JOb/"]
       path = ~/.gitconfig-github
   ```

## Recommended Action
For your multi-account workflow, I recommend:

1. Create the separate config files
2. Update your main ~/.gitconfig with conditional includes
3. Organize projects into appropriate directories
4. Set up GitHub authentication with Personal Access Token

Would you like me to help you implement any of these approaches?
