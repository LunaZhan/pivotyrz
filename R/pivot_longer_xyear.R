#' Pivot longer when dataset contains data in wide form, with columns following format of Xyear
#'
#' @param dataname dataset to pivot longer to
#' @param varname id name column
#' @param varname variable name to put the pivoted values to 
#'
#' @returns the pivotted dataset
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
