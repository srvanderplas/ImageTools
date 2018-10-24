#' Get all NxN slices from the image
#'
#' In some situations it is useful to divide an image up into NxN chunks - one
#' use case is when training a neural network. Another, more artistic use would
#' be when creating sub-images which can be reassembled to form a photomosaic.
#' @param im image
#' @param size a scalar or vector of length two indicating the size of the resulting images
#' @param delta a scalar or vector of length two indicating the offset for adjacent images
#' @param partial include partial image subsets?
#' @return a data frame with image chunks, x and y coordinates of the top corner of the images, and a prefix for the image name.
#' @export
#' @importFrom imager is.cimg
#' @importFrom imager imsub
#' @importFrom imager '%inr%'
#' @examples
#' library(imager)
#' library(ImageTools)
#' all_slices(boats, size = c(128, 128))
all_slices <- function(im, size = c(256, 256), delta = c(16, 16), partial = FALSE) {
  x <- y <- NULL
  stopifnot(imager::is.cimg(im))

  imdim <- dim(im)[1:2]

  if (!partial) {
    xseq <- seq(1, imdim[1] - size[1] + 1, by = delta[1])
    yseq <- seq(1, imdim[2] - size[2] + 1, by = delta[2])
  } else {
    xseq <- seq(-size[1] + delta[1], imdim[1] - size[1], by = delta[1])
    yseq <- seq(-size[2] + delta[2], imdim[2] - size[2], by = delta[2])
  }

  tmp <- expand.grid(x = xseq, y = yseq)

  tmp$img <- lapply(1:nrow(tmp), function(i) {
    xx <- pmax(1, tmp$x[i])
    yy <- pmax(1, tmp$y[i])
    imager::imsub(im, x %inr% c(xx, xx + size[1]), y %inr% c(yy, yy + size[2]))
  })

  xseqdim <- sprintf("x=%%0%dd", ceiling(log10(max(xseq) + 1)))
  yseqdim <- sprintf("_y=%%0%dd", ceiling(log10(max(yseq) + 1)))

  tmp$prefix <- sprintf(paste0(xseqdim, yseqdim), tmp$x, tmp$y)
  tmp
}
