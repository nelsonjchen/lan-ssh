import { Container, getContainer } from "@cloudflare/containers";

export class CronContainer extends Container {
  sleepAfter = "5m";
}

interface Env {
  CRON_CONTAINER: DurableObjectNamespace<CronContainer>;
}

export default {
  async fetch(): Promise<Response> {
    return new Response(
      "This Worker runs a cron job to execute a container on a schedule.",
    );
  },

  async scheduled(
    _controller: ScheduledController,
    env: Env,
  ): Promise<void> {
    // The container now has the keys baked in, so we don't need to pass them.
    await getContainer(env.CRON_CONTAINER).startAndWaitForPorts();
  },
};