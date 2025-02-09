return {
  'jake-stewart/multicursor.nvim',
  branch = '1.0',
  config = function()
    local mc = require 'multicursor-nvim'

    mc.setup()

    local set = vim.keymap.set

    -- Add or skip cursor above/below the main cursor.
    set({ 'n', 'v' }, '<up>', function()
      mc.lineAddCursor(-1)
    end, { desc = 'Add cursor above the main cursor' })
    set({ 'n', 'v' }, '<down>', function()
      mc.lineAddCursor(1)
    end, { desc = 'Add cursor below the main cursor' })
    set({ 'n', 'v' }, '<leader><up>', function()
      mc.lineSkipCursor(-1)
    end, { desc = 'Skip adding cursor above the main cursor' })
    set({ 'n', 'v' }, '<leader><down>', function()
      mc.lineSkipCursor(1)
    end, { desc = 'Skip adding cursor below the main cursor' })

    -- Add or skip adding a new cursor by matching word/selection
    set({ 'n', 'v' }, '<leader>n', function()
      mc.matchAddCursor(1)
    end, { desc = 'Add cursor by matching word/selection forward' })
    set({ 'n', 'v' }, '<leader>s', function()
      mc.matchSkipCursor(1)
    end, { desc = 'Skip adding cursor by matching word/selection forward' })
    set({ 'n', 'v' }, '<leader>N', function()
      mc.matchAddCursor(-1)
    end, { desc = 'Add cursor by matching word/selection backward' })
    set({ 'n', 'v' }, '<leader>S', function()
      mc.matchSkipCursor(-1)
    end, { desc = 'Skip adding cursor by matching word/selection backward' })

    -- Add all matches in the document
    set({ 'n', 'v' }, '<leader>A', mc.matchAllAddCursors, { desc = 'Select all matches in the document' })

    -- Rotate the main cursor.
    set({ 'n', 'v' }, '<left>', mc.nextCursor, { desc = 'Rotate to the next cursor' })
    set({ 'n', 'v' }, '<right>', mc.prevCursor, { desc = 'Rotate to the previous cursor' })

    -- Delete the main cursor.
    set({ 'n', 'v' }, '<leader>x', mc.deleteCursor, { desc = 'Delete the main cursor' })

    -- Add and remove cursors with control + left click.
    set('n', '<c-leftmouse>', mc.handleMouse, { desc = 'Add/remove cursors with control + left click' })

    -- Easy way to add and remove cursors using the main cursor.
    set({ 'n', 'v' }, '<c-q>', mc.toggleCursor, { desc = 'Toggle adding/removing cursors' })

    -- Clone every cursor and disable the originals.
    set({ 'n', 'v' }, '<leader><c-q>', mc.duplicateCursors, { desc = 'Duplicate all cursors and disable originals' })

    set('n', '<esc>', function()
      if not mc.cursorsEnabled() then
        mc.enableCursors()
      elseif mc.hasCursors() then
        mc.clearCursors()
      else
        -- Default <esc> handler.
      end
    end, { desc = 'Enable/clear cursors or default <esc> behavior' })

    -- Bring back cursors if you accidentally clear them
    set('n', '<leader>gv', mc.restoreCursors, { desc = 'Restore previously cleared cursors' })

    -- Align cursor columns.
    set('n', '<leader>a', mc.alignCursors, { desc = 'Align cursor columns' })

    -- Split visual selections by regex.
    set('v', 'S', mc.splitCursors, { desc = 'Split visual selections by regex' })

    -- Append/insert for each line of visual selections.
    set('v', 'I', mc.insertVisual, { desc = 'Insert text at the start of each visual selection line' })
    set('v', 'A', mc.appendVisual, { desc = 'Append text at the end of each visual selection line' })

    -- Match new cursors within visual selections by regex.
    set('v', 'M', mc.matchCursors, { desc = 'Match new cursors within visual selections by regex' })

    -- Rotate visual selection contents.
    set('v', '<leader>t', function()
      mc.transposeCursors(1)
    end, { desc = 'Rotate visual selection contents forward' })
    set('v', '<leader>T', function()
      mc.transposeCursors(-1)
    end, { desc = 'Rotate visual selection contents backward' })

    -- Jumplist support
    set({ 'v', 'n' }, '<c-i>', mc.jumpForward, { desc = 'Jump forward in the jumplist' })
    set({ 'v', 'n' }, '<c-o>', mc.jumpBackward, { desc = 'Jump backward in the jumplist' })

    -- Customize how cursors look.
    local hl = vim.api.nvim_set_hl
    hl(0, 'MultiCursorCursor', { link = 'Cursor' })
    hl(0, 'MultiCursorVisual', { link = 'Visual' })
    hl(0, 'MultiCursorSign', { link = 'SignColumn' })
    hl(0, 'MultiCursorDisabledCursor', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledVisual', { link = 'Visual' })
    hl(0, 'MultiCursorDisabledSign', { link = 'SignColumn' })
  end,
}
