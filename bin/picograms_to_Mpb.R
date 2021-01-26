

picograms <- c("Atexcac"=0.37, "Carmen"=0.41, "Preciosa"=0.25, "Quechulac"=0.33, "Alchichica"=0.4)

picograms_to_Mpb <- function(picograms) {
  ## converts picograms value to Mpb (million base pairs)
  ## Arguments:
  # Mpb: value of Mpb converted to be pg
  Mpb <- ((picograms*978)) ## 1pg = 978 Mpb
  return(Mpb)
}

picograms_to_Mpb(picograms)
