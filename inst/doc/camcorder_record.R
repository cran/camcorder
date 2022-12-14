## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  warning = FALSE,
  message = FALSE
)

## ----setup-record, eval=TRUE--------------------------------------------------
library(camcorder)

gg_record(
  dir = file.path(tempdir(), "recording"), 
  device = "png", # we need to set the Cairo device
  width = 8,
  height = 5
)

## ----load-ggplot-hidden, include=FALSE----------------------------------------
library(ggplot2)

## ----style-diamonds-plot------------------------------------------------------
ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point()

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_point(alpha = .2)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_bin2d()

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex()

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex() +
  scale_fill_viridis_c(option = "magma")

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex() +
  scale_fill_viridis_c(option = "magma", direction = -1)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex() +
  scale_fill_viridis_b(option = "magma", direction = -1)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(color = "white") +
  scale_fill_viridis_b(option = "magma", direction = -1)

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(color = "white") +
  scale_fill_viridis_b(option = "magma", direction = -1) +
  theme_minimal()

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(color = "white") +
  scale_fill_viridis_b(option = "magma", direction = -1) +
  theme_minimal() +
  theme(panel.grid.minor = element_blank())

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(color = "white") +
  coord_cartesian(clip = "off") +
  scale_y_continuous(labels = scales::dollar_format()) +
  scale_fill_viridis_b(option = "magma", direction = -1) +
  theme_minimal() +
  theme(panel.grid.minor = element_blank()) +
  labs(x = "Carat", y = NULL, fill = "Number of diamonds")

ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(color = "white") +
  coord_cartesian(clip = "off") +
  scale_y_continuous(labels = scales::dollar_format()) +
  scale_fill_viridis_b(option = "magma", direction = -1) +
  theme_minimal() +
  theme(
    panel.grid.minor = element_blank(),
    legend.position = "top"
  ) +
  labs(x = "Carat", y = NULL, fill = "Number of diamonds")

g <- 
  ggplot(diamonds, aes(x = carat, y = price)) +
  geom_hex(color = "white") +
  coord_cartesian(clip = "off") +
  scale_y_continuous(labels = scales::dollar_format()) +
  scale_fill_viridis_b(
    option = "magma", direction = -1,
    guide = guide_colorsteps(
      title.position = "top", show.limits = TRUE, 
      barwidth = unit(16, "lines"), barheight = unit(.8, "lines")
    )
  ) +
  theme_minimal() +
  theme(
    panel.grid.minor = element_blank(),
    legend.position = "top"
  ) +
  labs(x = "Carat", y = NULL, fill = "Number of diamonds")

g

## ----resize, eval=FALSE-------------------------------------------------------
#  gg_resize_film(
#    height = 5,
#    width = 5,
#    units = "in",
#    dpi = 600
#  )

## ----plot-new-width, fig.width=5, fig.height=5--------------------------------
g

## ----playback, eval = FALSE---------------------------------------------------
#  gg_playback(
#    name = file.path(tempdir(), "recording", "diamonds.gif"),
#    first_image_duration = 4,
#    last_image_duration = 12,
#    frame_duration = .5,
#    image_resize = 900,
#    width = 800,
#    height = 800
#  )

