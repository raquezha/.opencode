#!/bin/bash
# setup-secrets.sh - Interactive secrets setup for OpenCode
# Creates and populates .secrets/ directory with required API keys and tokens

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get script directory (where opencode config lives)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SECRETS_DIR="$SCRIPT_DIR/.secrets"
OLD_SECRETS_DIR="$HOME/.secrets"

# Required secrets
declare -a REQUIRED_SECRETS=(
    "brave-api-key|Brave Search API key|https://brave.com/search/api/"
    "github-token|GitHub Personal Access Token|https://github.com/settings/tokens"
    "gitlab-token|GitLab Personal Access Token|Your GitLab instance"
    "gitlab-api-url|GitLab API URL|e.g., https://gitlab.example.com/api/v4"
)

echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}  OpenCode Secrets Setup${NC}"
echo -e "${BLUE}======================================${NC}"
echo ""

# Create .secrets directory if it doesn't exist
if [ ! -d "$SECRETS_DIR" ]; then
    echo -e "${YELLOW}Creating .secrets/ directory...${NC}"
    mkdir -p "$SECRETS_DIR"
    chmod 700 "$SECRETS_DIR"
    echo -e "${GREEN}Created $SECRETS_DIR with permissions 700${NC}"
else
    echo -e "${GREEN}.secrets/ directory already exists${NC}"
fi
echo ""

# Check for old secrets to migrate
if [ -d "$OLD_SECRETS_DIR" ]; then
    echo -e "${YELLOW}Found existing secrets in $OLD_SECRETS_DIR${NC}"
    echo -n "Would you like to migrate them to the new location? [y/N]: "
    read -r migrate_response
    if [[ "$migrate_response" =~ ^[Yy]$ ]]; then
        for file in "$OLD_SECRETS_DIR"/*; do
            if [ -f "$file" ]; then
                filename=$(basename "$file")
                if [ ! -f "$SECRETS_DIR/$filename" ]; then
                    cp "$file" "$SECRETS_DIR/$filename"
                    chmod 600 "$SECRETS_DIR/$filename"
                    echo -e "${GREEN}  Migrated: $filename${NC}"
                else
                    echo -e "${YELLOW}  Skipped (already exists): $filename${NC}"
                fi
            fi
        done
        echo ""
        echo -n "Delete old secrets directory ($OLD_SECRETS_DIR)? [y/N]: "
        read -r delete_response
        if [[ "$delete_response" =~ ^[Yy]$ ]]; then
            rm -rf "$OLD_SECRETS_DIR"
            echo -e "${GREEN}Deleted $OLD_SECRETS_DIR${NC}"
        fi
    fi
    echo ""
fi

# Process each required secret
echo -e "${BLUE}Checking required secrets...${NC}"
echo ""

missing_count=0
for secret_info in "${REQUIRED_SECRETS[@]}"; do
    IFS='|' read -r secret_name secret_desc secret_url <<< "$secret_info"
    secret_file="$SECRETS_DIR/$secret_name"
    
    if [ -f "$secret_file" ] && [ -s "$secret_file" ]; then
        echo -e "${GREEN}[OK]${NC} $secret_name"
    else
        echo -e "${RED}[MISSING]${NC} $secret_name"
        echo -e "    ${YELLOW}$secret_desc${NC}"
        echo -e "    Get from: $secret_url"
        echo ""
        echo -n "Enter value for $secret_name (or press Enter to skip): "
        read -rs secret_value
        echo ""
        
        if [ -n "$secret_value" ]; then
            echo -n "$secret_value" > "$secret_file"
            chmod 600 "$secret_file"
            echo -e "${GREEN}  Saved $secret_name${NC}"
        else
            echo -e "${YELLOW}  Skipped $secret_name${NC}"
            ((missing_count++))
        fi
        echo ""
    fi
done

# Set permissions on all secret files
chmod 600 "$SECRETS_DIR"/* 2>/dev/null || true

echo ""
echo -e "${BLUE}======================================${NC}"
echo -e "${BLUE}  Summary${NC}"
echo -e "${BLUE}======================================${NC}"
echo ""

# Final status check
all_present=true
for secret_info in "${REQUIRED_SECRETS[@]}"; do
    IFS='|' read -r secret_name secret_desc secret_url <<< "$secret_info"
    secret_file="$SECRETS_DIR/$secret_name"
    
    if [ -f "$secret_file" ] && [ -s "$secret_file" ]; then
        echo -e "${GREEN}[OK]${NC} $secret_name"
    else
        echo -e "${RED}[MISSING]${NC} $secret_name"
        all_present=false
    fi
done

echo ""
if [ "$all_present" = true ]; then
    echo -e "${GREEN}All secrets configured successfully!${NC}"
else
    echo -e "${YELLOW}Some secrets are missing. You can run this script again later.${NC}"
    echo -e "Or manually create files in: $SECRETS_DIR"
fi

echo ""
echo -e "${BLUE}Security reminders:${NC}"
echo "  - Secrets directory: $SECRETS_DIR (permissions: 700)"
echo "  - Secret files have permissions: 600"
echo "  - Ensure disk encryption (FileVault) is enabled"
echo "  - Never commit .secrets/ to git"
echo ""
