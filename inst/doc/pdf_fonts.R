## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = FALSE
)

## ----setup-record-pdf---------------------------------------------------------
library(ggplot2)
library(camcorder)

gg_record(
  dir = file.path(tempdir(), "recording"), 
  device = cairo_pdf, # we need to set the Cairo device
  width = 8,
  height = 5
)

## ----font-list----------------------------------------------------------------
systemfonts::system_fonts()

## ----font-search--------------------------------------------------------------
systemfonts::system_fonts() |> 
  dplyr::filter(grepl("Dyna", family)) |>
  dplyr::pull(name) |> 
  sort()

## ----plot-base-family, eval=FALSE---------------------------------------------
#  g <-
#    ggplot(diamonds, aes(x = cut)) +
#    geom_bar(fill = "grey65") +
#    theme_minimal(
#      base_family = "DynaPuff Condensed",
#      base_size = 24
#    )
#  
#  g

## ----plot-title-family, eval=FALSE--------------------------------------------
#  g +
#    ggtitle("PDFs are a font lovers best friend") +
#    theme(
#      plot.title.position = "plot",
#      plot.title = element_text(family = "DynaPuff", face = "bold")
#    )

