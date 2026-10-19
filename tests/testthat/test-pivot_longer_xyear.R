test_that("pivot_longer_xyear pivots X-year columns into long form", {

maternal_mortality <- maternal_mortality |> 
  dplyr::filter(iso == "AFG" | iso == "AGO") |> 
  dplyr::select(iso, X2000, X2001)
  
  result <- pivot_longer_xyear(dataname = maternal_mortality, id = iso, varname = "matmor")

  expect_named(result, c("iso", "year", "matmor"))
  expect_equal(nrow(result), 4)
  expect_type(result$year, "double")
  # sorted by id, then year
  expect_equal(result$iso, c("AFG", "AFG", "AGO", "AGO"))
  expect_equal(result$year, c(2000, 2001, 2000, 2001))
  expect_equal(result$matmor, c(1450, 1390, 827, 766))
})

test_that("pivot_longer_xyear drops non-id, non-X columns and keeps NAs", {
  wide <- data.frame(
    id = "A",
    other = "drop me",
    X2018 = NA_real_,
    X2019 = 5
  )

  result <- pivot_longer_xyear(dataname = wide, id = id, varname = "value")

  expect_false("other" %in% names(result))
  expect_equal(result$value, c(NA, 5))
})
