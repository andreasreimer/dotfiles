return {
  {
    'nvim-telescope/telescope.nvim',
    opts = {
      extensions = {
        thesaurus = {
          provider = 'datamuse',
        },
      },
    },
  },
  --   {
  --     'ron89/thesaurus_query.vim',
  --     vim.g.tq_language == { 'en', 'de' },
  --     vim.g.tq_enabled_backends == { 'openoffice_en', 'mthesaur_txt', 'openthesaurus_de', 'datamuse_com' },
  --   },
}
