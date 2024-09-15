# Contributing

Contributions are very welcome.
Please file issues or submit pull requests in our GitHub repository.
All contributors will be acknowledged.

## In Brief

-   Use `pip install -r requirements.txt`
    to install the packages required by the helper tools and Python examples.
    You may wish to create a new virtual environment before doing so.
    All code has been tested with Python 3.12.1.

-   The tutorial lives in `src/*/index.md`,
    which is translated into a static GitHub Pages website using [Ark][ark].

-   The source files for examples are in their section directories
    along with captured output in `.out` files.

-   `Makefile` contains the commands used to re-run each example.
    If you add a new example,
    please add a corresponding rule in `Makefile`.
    -   `make depend.mk` rebuilds the list of extra dependencies.
        Please do not update `depend.mk` by hand.

-   Use a level-2 heading for each sub-topic.
    Use `{: .aside}` for an aside
    or `{: .exercise}` for exercise.

-   Use `[%inc "file.ext" %]` to include a text file.
    If `mark=label` is present,
    only code between comments `[label]` and `[/label]` is kept.

-   Use `[% figure slug="some_slug" img="filename.ext" caption="text" alt="text" %]`
    to include a figure.

-   Use `[% g key "text" %]` to link to glossary entries.
    The text is inserted and highlighted;
    the key must identify an entry in `info/glossary.yml`,
    which is in [Glosario][glosario] format.

-   Please create SVG diagrams using [draw.io][draw_io].
    Please use 14-point Helvetica for text,
    solid 1-point black lines,
    and unfilled objects.

-   All external links are written using `[box][notation]` inline
    and defined in `info/links.yml`.

## Logical Structure

-   Introduction
    -   A *learner persona* that characterizes the intended audience in concrete terms.
    -   *Prerequisites* (which should be interpreted with reference to the learner persona).
    -   *Learning objectives* that define the tutorial's scope.
    -   *Setup instructions* that instructors and learners must go through in order to code along

-   *Topics* are numbered.
    Each contains one code sample, its output, and notes for the instructor.
    Learners are *not* expected to be able to understand topics without instructor elaboration.

-   *Asides* are not numbered,
    and contain code-less explanatory material,
    additional setup instructions,
    *concept maps* summarizing recently-introduced ideas,
    etc.

-   *Exercises* are numbered.
    An exercise section may include any number of exercises.

-   Topics of both kinds may contain *glossary references*
    and/or *explanatory diagrams*.

-   Appendices
    -   A *glossary* that defines terms called out in the topics.
    -   *Acknowledgments* that point at inspirations and thank contributors.

## Labels

| Name             | Description                  | Color   |
| ---------------- | ---------------------------- | ------- |
| change           | something different          | #FBCA04 |
| feature          | new feature                  | #B60205 |
| fix              | something broken             | #5319E7 |
| good first issue | newcomers are always welcome | #D4C5F9 |
| talk             | question or discussion       | #0E8A16 |
| task             | one-off task                 | #1D76DB |

Please use [Conventional Commits][conventional] style for pull requests
by using `change:`, `feature:`, `fix:`, or `task:` as the first word
in the title of the commit message.
You may also use `publish:` if the PR just rebuilds the HTML version of the lesson.

## Contributors

**[Greg Wilson][wilson_greg]**
was the co-founder and first Executive Director of Software Carpentry
and received ACM SIGSOFT's Influential Educator Award in 2020.

**[Konstantinos Kitsios][kitsios_konstantinos]**
is a PhD student at University of Zurich,
working on applications of machine learning to software engineering.
Previously he worked as a software engineer at Tesla.

**[Pao Corrales][corrales_pao]**
has a PhD in Atmospheric Sciences and works on improving severe weather forecasts in Argentina.
She loves teaching science and programming using evidence-based techniques centered on the students and their context.

## FAQ

Why SQL?
:   Because if you dig down far enough,
    almost every data science project sits on top of a relational database.
    ([Jon Udell][udell_jon] once called [PostgreSQL][postgresql]
    "an operating system for data science".)
    SQL's relational model has also been a powerful influence
    on dataframe libraries like [the tidyverse][tidyverse],
    [Pandas][pandas],
    and [Polars][polars];
    understanding the former therefore helps people understand the latter.

Why [McCole][mccole]?
:   The first version of this tutorial used [Jekyll][jekyll]
    because it is the default for [GitHub Pages][ghp]
    and because its frustrating limitations would discourage contributors
    from messing around with the template instead of writing content.
    However,
    those limitations proved more frustrating than anticipated:
    in particular,
    very few data scientists speak Ruby,
    so previewing changes locally required them to install and use
    yet another language framework.

Why Make?
:   It runs everywhere,
    no other build tool is a clear successor,
    and,
    like Jekyll,
    it's uncomfortable enough to use that people won't be tempted to fiddle with it
    when they could be writing.

Why hand-drawn figures rather than [Graphviz][graphviz] or [Mermaid][mermaid]?
:   Because it's faster to Just Effing Draw than it is
    to try to tweak layout parameters for text-to-diagram systems.
    If you really want to make developers' lives better,
    build a diff-and-merge tool for SVG:
    programmers shouldn't have to use punchard-compatible data formats in the 21st Century
    just to get the benefits of version control.

Why make this tutorial freely available?
:   Because if we all give a little, we all get a lot.

## Colophon

-   The tutorial text uses [Atkinson Hyperlegible][atkinson],
    which was designed to be easy for people with impaired vision to read.
    Code uses Source Code Pro and diagrams use Helvetica.

-   The colors in this theme
    are lightened versions of those used in [classic Canadian postage stamps][stamps].
    The art in the title is by [Danielle Navarro][navarro_danielle]
    and used with her gracious permission.

-   The CSS files used to style code were obtained from [highlight-css][highlight_css];
    legibility was checked using [WebAIM WAVE][wave].

-   Diagrams were created with the desktop version of [draw.io][draw_io].

-   The site is hosted on [GitHub Pages][ghp].

-   Traffic statistics are collected using [Plausible][plausible],
    which provides a lightweight ethical alternative to surveillance capitalism.

-   Thanks to the authors of [BeautifulSoup][bs4],
    [html5validator][html5validator],
    [ruff][ruff],
    and all the other software used in this project.
    If we all give a little,
    we all get a lot.


[conventional]: https://www.conventionalcommits.org/
[corrales_pao]: https://paocorrales.github.io/
[draw_io]: https://www.drawio.com/
[ghp]: https://pages.github.com/
[glosario]: https://glosario.carpentries.org/
[graphviz]: https://graphviz.org/
[jekyll]: https://jekyllrb.com/
[kitsios_konstantinos]: https://kitsiosk.github.io/
[mccole]: https://pypi.org/project/mccole/
[mermaid]: https://mermaid.js.org/
[palmer_penguins]: https://allisonhorst.github.io/palmerpenguins/
[pandas]: https://pandas.pydata.org/
[polars]: https://pola.rs/
[postgresql]: https://www.postgresql.org/
[tidyverse]: https://www.tidyverse.org/
[udell_jon]: https://blog.jonudell.net/
[wilson_greg]: https://third-bit.com/
