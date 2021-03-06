# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Determines whether to still load settings configured via autoconfig.yml
config.load_autoconfig(False)

# Force a Qt platform to use. This sets the `QT_QPA_PLATFORM`
# environment variable and is useful to force using the XCB plugin when
# running QtWebEngine on Wayland.
# Type: String
c.qt.force_platform = 'xcb'

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Open new windows in private browsing mode which does not record
# visited pages.
# Type: Bool
c.content.private_browsing = False

# Which categories to show (in which order) in the :open completion.
# Type: FlagList
# Valid values:
#   - searchengines
#   - quickmarks
#   - bookmarks
#   - history
c.completion.open_categories = ['quickmarks']

# Padding (in pixels) around text for tabs.
# Type: Padding
c.tabs.padding = {'bottom': 9, 'left': 5, 'right': 5, 'top': 9}

# Alignment of the text inside of tabs.
# Type: TextAlignment
# Valid values:
#   - left
#   - right
#   - center
c.tabs.title.alignment = 'center'

# What search to start when something else than a URL is entered.
# Type: String
# Valid values:
#   - naive: Use simple/naive check.
#   - dns: Use DNS requests (might be slow!).
#   - never: Never search automatically.
c.url.auto_search = 'naive'

# Page to open if :open -t/-b/-w is used without URL. Use `about:blank`
# for a blank page.
# Type: FuzzyUrl
c.url.default_page = 'https://www.duckduckgo.com'

# Open base URL of the searchengine if a searchengine shortcut is
# invoked without parameters.
# Type: Bool
c.url.open_base_url = True

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://www.duckduckgo.com/?q={}',
                            'g':  'https://www.google.com/search?q={}',
                            'gh': 'https://www.github.com/search?q={}',
                             'r': 'https://www.reddit.com/r/{}',
                            'yt': 'https://www.youtube.com/results?search_query={}',
                            'aw': 'https://wiki.archlinux.org/index.php?search={}',
                            'wp': 'https://en.wikipedia.org/w/index.php?search={}'}

# Page(s) to open at the start.
# Type: List of FuzzyUrl, or FuzzyUrl
c.url.start_pages = 'https://www.duckduckgo.com'

# Default zoom level.
# Type: Perc
c.zoom.default = '120%'

# Background color of the completion widget for odd rows.
# Type: QssColor
c.colors.completion.odd.bg = '#111111'

# Background color of the completion widget for even rows.
# Type: QssColor
c.colors.completion.even.bg = 'black'

# Background color of the completion widget category headers.
# Type: QssColor
c.colors.completion.category.bg = 'black'

# Background color for prompts.
# Type: QssColor
c.colors.prompts.bg = 'black'

# Background color of the statusbar in private browsing mode.
# Type: QssColor
c.colors.statusbar.private.bg = 'black'

# Background color of the statusbar in private browsing + command mode.
# Type: QssColor
c.colors.statusbar.command.private.bg = 'black'

# Render pages in dark mode.
c.colors.webpage.darkmode.enabled = True

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '15pt monospace'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = 'bold 15pt monospace'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = '15pt Fira mono'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs.selected = '14pt DejaVu Sans'
c.fonts.tabs.unselected = '14pt DejaVu Sans'

# Smooth scrolling.
# Type: Bool
c.scrolling.smooth = True

# Bindings for normal mode
config.bind('<Ctrl+->', 'zoom-out')
config.bind('<Ctrl+0>', 'zoom')
config.bind('Ctrl+=>', 'zoom-in')
config.bind('F', 'hint all tab-bg')
config.bind('J', 'tab-prev')
config.bind('K', 'tab-next')
config.unbind('=', mode='normal')
config.unbind('d', mode='normal')
