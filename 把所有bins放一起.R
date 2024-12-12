setwd("F:/binning/Annotation/phylophlan/3bas")  # 请将此路径修改为你的实际工作目录

# 获取工作目录下的所有文件夹
folders <- list.dirs(path = ".", full.names = TRUE, recursive = FALSE)

# 遍历每个文件夹
for (folder in folders) {
  # 获取文件夹名称
  folder_name <- basename(folder)
  
  # 获取当前文件夹下所有的 .fna 文件
  fna_files <- list.files(path = folder, pattern = "\\.fna$", full.names = TRUE)
  
  # 遍历每个 .fna 文件并重命名
  for (fna_file in fna_files) {
    # 获取原文件名
    file_name <- basename(fna_file)
    
    # 创建新文件名，添加文件夹名称作为前缀
    new_file_name <- paste0(folder_name, "_", file_name)
    
    # 将文件移动到工作目录下，并重命名
    file.rename(fna_file, file.path("./", new_file_name))
  }
}
