rails: cd demo; bin/rails s -p 4000
tailwind: cd demo; npx postcss -o app/assets/builds/application.css app/assets/stylesheets/application.css --watch
css: npx chokidar "app/components/**/*.tcss" -c "npm run build:css"
js: npx chokidar "app/components/**/*.ts" -i "app/components/**/*.d.ts" -c "npm run build:js"
