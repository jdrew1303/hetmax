global.p = (x) -> console.log JSON.stringify x
global.w = (x) -> require('fs').writeFileSync 'out.html', x
