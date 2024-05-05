import { defineConfig } from "vite";
import { compiler } from "@lifeart/gxt/compiler";

export default defineConfig(({ mode }) => ({
  plugins: [compiler(mode)],
  rollupOptions: {
    input: {
      main: "index.html",
      tests: "tests.html",
    }
  }
}));