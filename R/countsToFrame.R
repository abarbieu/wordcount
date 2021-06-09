#' A function for converting a table of word frequencies to a data frame
#'
#' @param tbl The frequency table of words
#' @param wordColName What to name the column containing the words
#' @param freqColName What to name the column containing the frequencies
#'
#' @return A data frame containing the frequency data
#'
#' @export
countsToFrame <- function(tbl, wordColName = "Word", freqColName = "Freq"){
  frm <- as.data.frame.table(tbl)
  colnames(frm)[1] <- wordColName
  colnames(frm)[2] <- freqColName
  frm
}
