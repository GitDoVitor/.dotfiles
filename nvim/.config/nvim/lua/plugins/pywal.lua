return {
  'AlphaTechnolog/pywal.nvim', as = 'pywal',
  config = function()
    local pywal = require('pywal')
    pywal.setup()
  end
}
