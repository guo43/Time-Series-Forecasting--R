library(dplyr)
library(fpp2)
library(stringr)
library(seasonal)

# import files in to R
setwd("/Users/qingguo/Desktop/1C_Company/Data")
fnames = dir(getwd(), full.names = FALSE)
data_list = sapply(fnames, read.csv, simplify = FALSE) %>% sapply(as.data.frame)

# batch name dataset as its file names 
vnames = str_sub(fnames, 1, -5)
for ( i in 1:length(vnames)) {
  assign(vnames[[i]], data_list[[i]])
}

# preprocesing data 
sales_train = merge(sales_train, select(items,-item_name), by.x = "item_id", by.y = "item_id", all.x = TRUE)
sales_train$date = as.Date(sales_train$date, "%d.%m.%Y")
sales_train = arrange(sales_train,date)

# monthly total sales 
month_sales = sales_train %>% 
  group_by(date_block_num, shop_id, item_id,item_price) %>% 
  summarise(item_cnt_month = sum(item_cnt_day))













