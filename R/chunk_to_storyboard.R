chunk_to_storyboard <- function(chunk_name){
  
  knitrExtra::chunk_code_get(chunk_name) |>
    code_to_storyboard()
  
}
