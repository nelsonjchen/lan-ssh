"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.CronContainer = void 0;
const containers_1 = require("@cloudflare/containers");
class CronContainer extends containers_1.Container {
    sleepAfter = "5m";
}
exports.CronContainer = CronContainer;
exports.default = {
    async fetch() {
        return new Response("This Worker runs a cron job to execute a container on a schedule.");
    },
    async scheduled(_controller, env) {
        await (0, containers_1.getContainer)(env.CRON_CONTAINER).startAndWaitForPorts({
            startOptions: {
                envVars: {
                    ID_RSA: env.ID_RSA,
                    ID_ED25519: env.ID_ED25519,
                },
            },
        });
    },
};
