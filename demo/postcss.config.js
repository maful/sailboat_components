/** @type {import('postcss-load-config').Config} */
const config = {
  plugins: [
    require('postcss-import'),
    require('autoprefixer'),
    require('tailwindcss'),
  ]
}

module.exports = config
