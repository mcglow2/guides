import os
import sys
from datetime import date
from urllib.parse import urljoin

project = "Tufts RT Guides"
author = "Tufts University"
email = "tts-research@tufts.edu"

github_user = "tuftsrt"
github_repo = "guides"

copyright = "{:04} {}".format(date.today().year, author)

sys.path.append(os.path.abspath("_ext"))

extensions = [
    "gallery_directive",
    "myst_nb",
    "notfound.extension",
    "sphinx_copybutton",
    "sphinx_design",
    "sphinx_external_toc",
    "sphinx_togglebutton",
    "sphinx.ext.autosectionlabel",
    "sphinx.ext.extlinks",
    "sphinx.ext.graphviz",
    "sphinx.ext.intersphinx",
    "tags",
]

autosectionlabel_prefix_document = True

html_baseurl = "https://{}.github.io/{}/".format(github_user, github_repo)
html_favicon = "_static/favicon.ico"
html_last_updated_fmt = ""
html_logo = "_static/jumbo.png"
html_static_path = ['_static']
html_css_files = ["custom.css"]
html_theme = "pydata_sphinx_theme"
html_title = project

html_context = {
    "github_user": github_user,
    "github_repo": github_repo,
    "github_version": "main",
    "doc_path": "source",
}

icon_links = [
    {
        "name": "Tags",
        "url": "/{}/tags/index.html".format(github_repo),
        "icon": "fa-solid fa-tags",
        "attributes": {"target": "_self"},
    },
    {
        "name": "GitHub",
        "url": "https://github.com/{}/{}".format(github_user, github_repo),
        "icon": "fa-brands fa-github",
    },
    {
        "name": "Email",
        "url": "mailto:{}".format(email),
        "icon": "fa-solid fa-envelope",
    },
]

html_theme_options = {
    "announcement": ("Incomplete and under active development. "
                     "Subject to change without notice."),
    "footer_end": ["last-updated"],
    "footer_start": ["copyright"],
    "header_links_before_dropdown": 8,
    "icon_links": icon_links,
    "navigation_depth": 1, 
    "logo": {"text": project},
    "navbar_align": "content",
    "navigation_with_keys": False,
    "search_bar_text": "",
    "secondary_sidebar_items": [
        "page-toc",
        "tags",
        "edit-this-page",
        "sourcelink",
    ],
    "use_edit_page_button": True,
    "show_nav_level": 0,
    "collapse_navigation": True,
}

myst_enable_extensions = [
    "colon_fence",
    "deflist",
    "dollarmath",
    "fieldlist",
    "linkify",
    "replacements",
    "substitution",
]

nb_custom_formats = {
    ".Rmd": "rmd.convert",
}

notfound_urls_prefix = "/{}/".format(github_repo)

templates_path = ["_templates"]
