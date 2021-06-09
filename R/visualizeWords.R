#' A function for visualizing word frequencies
#'
#' @param freqData A data frame of frequencies (see wordcount, countsToFrame)
#'
#' @return A ggplot plot visualizing these frequencies
#'
#' @export
visualizeWords <- function(freqData){
  freqData %>%
    ggplot(aes(x=Word, y=Freq, fill = Word)) +
    geom_col() +
    labs(title = "Word Frequency",
         x="Word",
         y="Frequency") +
    coord_flip()
}
