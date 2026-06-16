/* eslint-env node */

/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  allowedDevOrigins: ["localhost:3000", "26.166.58.21"],
  output: "export",
  images: {
    unoptimized: true,
  },
};

module.exports = nextConfig;