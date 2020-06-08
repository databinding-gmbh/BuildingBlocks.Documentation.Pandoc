param (
	[string]$o = "wiki.pdf"
)
$homeMarkdownForGithubWiki = "Home.md"
if (Test-Path $homeMarkdownForGithubWiki) 
{
  Remove-Item $homeMarkdownForGithubWiki
}
$documentationInfo = "Documentation.info"
if (Test-Path $documentationInfo) 
{
  ren $documentationInfo Documentation.md
}
ren template.tex template.latex
pandoc (get-item -path "*.md").FullName -o $o --toc -N -V margin-top=50mm -V margin-left=20mm -V margin-right=20mm -V margin-bottom=30mm --template template -V titlepage=true -V toc-own-page=true -V page-background="layout-background.pdf" -V titlepage-background="layout-title-background.pdf" -V page-background-opacity=1 -V version=1.0.0 -V lang=de -F mermaid-filter.cmd