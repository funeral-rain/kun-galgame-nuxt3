# create pnpm base image
FROM node:lts-alpine3.22 AS base
ENV PNPM_HOME="/pnpm"
ENV PATH="$PNPM_HOME:$PATH"
RUN corepack enable

# build stage
FROM base AS builder
WORKDIR /app

COPY package.json pnpm-lock.yaml ./
RUN pnpm install --frozen-lockfile

COPY . .
RUN pnpm prisma:generate
RUN pnpm build

RUN CI=true pnpm prune --production --ignore-scripts

# production stage
FROM base AS production
WORKDIR /app

COPY --from=builder /app/.output ./.output
COPY --from=builder /app/node_modules ./node_modules
COPY --from=builder /app/package.json ./package.json
COPY --from=builder /app/pnpm-lock.yaml ./pnpm-lock.yaml

# prisma client files
COPY --from=builder /app/prisma ./prisma

# environment variables example file, generate .env file based on this
COPY .env.example ./.env.example

# entrypoint script
COPY docker/entrypoint.sh ./entrypoint.sh
RUN chmod +x ./entrypoint.sh



EXPOSE 7777

ENTRYPOINT ["./entrypoint.sh"]
CMD ["node", ".output/server/index.mjs"]