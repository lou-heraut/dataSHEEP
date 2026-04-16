
source("R/dataSHEEP.R")
source("R/color.R")
source("R/tools.R")
library(ggplot2)

verbose = FALSE


herd_plan = matrix(c("A", "C",
                     "B", "C"), ncol=2, byrow=TRUE)
herd = bring_grass(verbose=verbose)
herd = plan_of_herd(herd, herd_plan,
                    verbose=verbose)


A_plan = matrix(c("a", "b", "c"),
                ncol=3, byrow=TRUE)
A = bring_grass(verbose=verbose)
A = plan_of_herd(A, A_plan,
                 verbose=verbose)

A = add_sheep(A,
              sheep=contour(),
              id="a",
              verbose=verbose)
A = add_sheep(A,
              sheep=contour(),
              id="b",
              verbose=verbose)
A = add_sheep(A,
              sheep=contour(),
              id="c",
              verbose=verbose)


herd = add_sheep(herd,
                 sheep=A,
                 id="A",
                 verbose=verbose)


B_plan = matrix(c("a", "b"),
                ncol=2, byrow=TRUE)
B = bring_grass(verbose=verbose)
B = plan_of_herd(B, B_plan,
                 verbose=verbose)

B = add_sheep(B,
              sheep=contour(),
              id="a",
              verbose=verbose)
B = add_sheep(B,
              sheep=contour(),
              id="b",
              verbose=verbose)

herd = add_sheep(herd,
                 sheep=B,
                 id="B",
                 verbose=verbose)

herd = add_sheep(herd,
                 sheep=contour(),
                 id="C",
                 verbose=verbose)

res = return_to_sheepfold(herd,
                          paper_size="A4",
                          hjust=0, vjust=1,
                          verbose=verbose)
# ggplot2::ggsave(plot=res$plot,
#                 path=".",
#                 filename="test.pdf",
#                 width=res$paper_size[1],
#                 height=res$paper_size[2], units='cm',
#                 dpi=300,
#                 device=cairo_pdf)







# # Original matrix
# original_matrix <- matrix(c("A", "A", "B",
#                             "C", "C", "B"), nrow=2, byrow=TRUE)
# print("Original Matrix:")
# print(original_matrix)

# # Identify positions of "C"
# c_positions <- which(original_matrix == "C", arr.ind = TRUE)

# # Repeat each column n times where there is a "C"
# n <- 3
# cols_to_replicate <- c_positions[, 2]
# cols_not_to_replicate = 1:ncol(original_matrix)
# cols_not_to_replicate = cols_not_to_replicate[!(cols_not_to_replicate %in% cols_to_replicate)]

# repeated_columns <- original_matrix[, cols_to_replicate]
# repeated_matrix <- matrix(rep(repeated_columns, each = n),
#                           nrow=ncol(repeated_columns),
#                           byrow=TRUE)

# # Replace "C" columns with repeated ones
# # original_matrix[, cols_to_replicate] <- repeated_matrix

# mod = cbind(repeated_matrix, original_matrix[, cols_not_to_replicate])


# print("Modified Matrix:")
# print(mod)



# # Sample matrix
# mat <- matrix(1:9, nrow = 3)

# # Number of times to replicate each column
# n <- 2

# # Replicate each column
# replicated_mat <- mat[, rep(1:ncol(mat), each = n)]

# # Output
# print(replicated_mat)
