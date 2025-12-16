/**
 * env-protection plugin
 * 
 * Prevents OpenCode from reading sensitive files like .env, credentials, and private keys.
 * This protects against accidental exposure of secrets to AI models.
 */
export const EnvProtection = async ({ project, client, $, directory, worktree }) => {
  // Patterns that should be blocked from reading
  const blockedPatterns = [
    '.env',           // Environment files
    '.env.',          // .env.local, .env.production, etc.
    'credentials',    // Credential files
    '.pem',           // Private keys
    '.key',           // Private keys
    'id_rsa',         // SSH private keys
    'id_ed25519',     // SSH private keys
    '.p12',           // Certificate files
    '.pfx',           // Certificate files
    'secret',         // Files with 'secret' in name
  ];

  return {
    "tool.execute.before": async (input, output) => {
      // Only intercept read operations
      if (input.tool === "read") {
        const filePath = output.args.filePath || '';
        
        // Check if file path matches any blocked pattern
        const isBlocked = blockedPatterns.some(pattern => 
          filePath.toLowerCase().includes(pattern.toLowerCase())
        );
        
        if (isBlocked) {
          throw new Error(
            `🔒 Security: Reading "${filePath}" is blocked by env-protection plugin. ` +
            `This file may contain sensitive credentials.`
          );
        }
      }
    },
  };
};
