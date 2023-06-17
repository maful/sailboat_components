module.exports = {
  map: {
    annotation: false
  },
  plugins: [
    require('postcss-import'),
    require('postcss-preset-env')({
      stage: 2,
      // https://preset-env.cssdb.org/features/#stage-2
      features: {
        'nesting-rules': { noIsPseudoSelector: true },
      }
    }),
    process.env.CI === 'true' ? require('cssnano') : null
  ]
}
