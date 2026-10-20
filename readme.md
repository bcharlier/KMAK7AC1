# Statistical Exploration

Course materials and practical work for **KMAK7AC1 - Statistical Exploration**.

This Quarto website contains course notes, slides, tutorials and practical
work. The published website is available at:

<https://bcharlier.github.io/KMAK7AC1/>

## Contents

- `cours/`: course materials
- `td/`: tutorial sheets and exercises
- `tp/`: practical work and Quarto documentation
- `R/`: shared R helper functions
- `assets`: custom website styling
- `.github/workflows/quarto-pages.yml`: GitHub Pages deployment workflow

## Installation

- Install [Quarto](https://quarto.org/docs/get-started/)
- the website uses the Iconify Quarto extension for icons. If it is missing from a
fresh checkout, install it from the project root:

```bash
quarto add mcanouil/quarto-iconify@4.1.2
```

- R and its dependencies (listed in the [`DESCRIPTION` file](./DESCRIPTION)). You can install them in R using:
```bash
Rscript -e 'install.packages("remotes"); remotes::install_deps()'
```

- Python 3.12 or a compatible version and [needed packages](./requirements.txt)
```bash
python3 -m venv .venv
source .venv/bin/activate
python -m pip install --upgrade pip
pip install -r requirements.txt
```

The local [`.Rprofile`](./.Rprofile) uses `.venv/bin/python` when it exists. In continuous
integration, it preserves the Python interpreter configured by GitHub Actions.

## Render the website

Render the complete website from the project root:

```bash
quarto render
```

The generated website is written to `_site/`. To preview it locally:

```bash
quarto preview
```

To render a single document:

```bash
quarto render slides/ACP.qmd
quarto render td/1_ACP/TD.qmd
```

Run these commands from the project root so relative data paths resolve
correctly.

## Deployment

Every push to the `main` branch runs `.github/workflows/quarto-pages.yml`.
The workflow installs the dependencies, renders the website, uploads `_site/`
as a Pages artifact and deploys it to GitHub Pages.

The workflow can also be started manually from the **Actions** tab on GitHub.
Set the repository Pages source to **GitHub Actions** under
**Settings > Pages**.

## PDF rendering

### Current pipeline

It currently uses the HTML/CSS `@media print{}` feature to render a 
printable version of the `html` target. The styles are stored in a 
[custom CSS](assets/print-clean.css) file. At build time, a 
[bash script](assets/make-pdf.sh) is launched to generate the PDF using 
the Google Chrome browser engine.

In the `.qmd` file header, should appear:

```yaml
format: 
  html:
    output-file: fileName_topdf.html  # suffix "_topdf.html" is used to discover files to process 

other-links:
  - text: "Version PDF"
    icon: file-pdf
    href: "fileName.pdf"              # keep name consistency here to get the link work in webpage
```

### TODO 

Consider using [`paged.js`](https://pagedjs.org/), [`weasyprint`](https://weasyprint.org/), or any other option capable of handling PDF generation directly from `css` and compatible with HTML content (table, plotly, etc...) to use `format: pdf`. See, for example:

https://github.com/orgs/quarto-dev/discussions/2538#discussioncomment-3739791