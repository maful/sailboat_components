import * as esbuild from "esbuild"
import { execSync } from "child_process"

let tscPlugin = {
  name: "typesciptDeclarationPlugin",
  setup(build) {
    build.onEnd(result => {
      if (result.errors.length > 0) return
      execSync("npx tsc --emitDeclarationOnly")
    })
  }
}

await esbuild.build({
  entryPoints: ["app/components/sailboat/sailboat.ts"],
  bundle: true,
  target: "es2017",
  outfile: "app/assets/javascripts/sailboat_components.js",
  logLevel: "info",
  format: "esm",
  sourcemap: true,
  plugins: [tscPlugin]
})
