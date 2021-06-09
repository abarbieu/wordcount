#' A function for counting the frequencies of words in a vector of strings
#'
#' This function allows you to quickly analyze a large set of unorganized
#' strings in a customizable fashion
#'
#' @param data A vector of strings or a single string
#' @param n The number of top occurring words to display
#' @param wordRegex An optional regex to split the string apart
#' @param ignoreWords A vector of words to exclude from the analysis
#' @param removePunct Remove punctuation?
#' @param removeNums Remove numbers?
#' @param punctRegex Regex for punctuation to remove
#' @param numsRegex Regex for numbers to remove
#'
#' @return A sorted (descending) table of words and their frequencies
#'
#' @import stringr
#' @import dplyr
#'
#' @export
wordcount <- function(data, n=10, wordRegex = "[^ ,'\\[\\]]*",
                      ignoreWords = c(), removePunct = FALSE,
                      removeNums = FALSE,
                      punctRegex = "[[:punct:]]",
                      numsRegex = "[0-9]"){
  data %>%
    tolower() %>%
    { if(removePunct) str_replace_all(., punctRegex, " ") else . } %>%
    { if(removeNums) str_replace_all(., numsRegex, " ") else . } %>%
    str_extract_all(wordRegex) %>%
    unlist() %>%
    .[. != ""] %>%
    .[! . %in% ignoreWords] %>%
    table %>%
    sort(decreasing = TRUE) %>%
    .[1:n]
}
