# Cron Key Refresher

This project uses a Cloudflare Worker to run a container on a cron schedule. The container uses `git` to clone a repository, effectively refreshing the SSH keys.

## Setup

1.  **Install Dependencies:**
    ```bash
    npm install
    ```

2.  **Deploy the Worker:**
    ```bash
    npm run deploy
    ```

## How it Works

-   The `wrangler.toml` file is configured to run the worker on a cron schedule (`0 0 * * *` - every day at midnight UTC).
-   When the cron trigger fires, the `scheduled` handler in `src/index.ts` is executed.
-   The worker starts the container defined in the `Dockerfile`.
-   The `entrypoint.sh` script in the container uses the SSH keys baked into the image to clone the specified repository.