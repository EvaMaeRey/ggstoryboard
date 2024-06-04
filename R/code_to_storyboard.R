code_to_storyboard <- function(code = NULL){

unconnected_code <- code |> 
  stringr::str_trim() |> 
  stringr::str_remove("\\+$")


partialcode <- c()

for(i in 1:length(code)){
  
  partialcode[i] <- paste(unconnected_code[1:i], collapse = " + ")
  
}


p <- list()  # Partial code sequence

for(i in 1:length(partialcode)){
  
  p[[i]] <- eval(parse(text = partialcode[i]))
  
 label <- ifelse(i > 1, paste("+", unconnected_code[i]), unconnected_code[i])
 
  p[[i]] <- p[[i]] + ggplot2::annotate(geom = "text",
                              x = I(.025),
                              y = I(.95), 
                              hjust = 0,
                              vjust = 1,
                              label = label,
                              color = "red"
                              )
  # 
}

patchwork::wrap_plots(p, ncol = 2)

}
