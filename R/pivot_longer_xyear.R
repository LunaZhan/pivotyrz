#' Pivot longer when dataset contains data in wide form, with columns following format of Xyear
#'
#' @param dataname dataset to pivot longer, containing id column and year columns following patterns X2000...
#' @param varname id name column
#' @param varname A character string specifying the name of the pivotted values column.
#'
#' @returns the long-form dataset, containing id, year, and pivotted values
#'
#' @export
#' @examples
#' matmor <- pivot_longer_xyear(dataname = maternal_mortality, id = iso, varname = "matmor")

pivot_longer_xyear <- function(dataname, id, varname){
  dataname |>
    dplyr::select({{id}}, matches("^X\\d+")) |>
    tidyr::pivot_longer(cols = dplyr::starts_with("X"),
                 names_to = "year",
                 names_prefix = "X",
                 values_to = varname) |>
    dplyr::mutate(year = as.numeric(year)) |>
    dplyr::arrange({{id}}, year) 
}
