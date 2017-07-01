source 'https://rubygems.org'

require 'json'
require 'open-uri'
versions = JSON.parse(open('https://pages.github.com/versions.json').read)

gem 'github-pages', group: :jekyll_plugins
gem 'jekyll-theme-modernist'

#Various Filter dependancies 
gem 'github-linguist' # for SyntaxHighlightFilte
gem 'commonmarker'    # for MarkdownFilter
