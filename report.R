## Prepare plots and tables for report

## Before:
## After:
#install_github("ices-tools-prod/icesTAF")
library(icesTAF)
#Please don't refer to a local folder'
#setwd("~/Documents/ICES grupos/TAF/2020_ane.27.9a_assessment_allin_almosthere")
#change DATA.bib sources
taf.bootstrap()
#copy SOFTWARE.bib from the last TAF folder
#taf.bootstrap()
#taf.library(Rgadget)
#setwd("..")
mkdir("report")
cp("bootstrap/data/*", "report")
cp("bootstrap/software/Latex/*","report")
cp("Assessment2023prov_May8.Rnw","report")
#cp("bootstrap/initial/software/Latex/*","report")
taf.library(Rgadget)
setwd("report")

Sweave("Assessment2023prov_May8.Rnw" , encoding = "UTF-8")
ret<-"Assessment2023prov_May8.tex"
x <- system(paste('pdflatex -halt-on-error', ret))
reti<-"Assessment2023prov_May8.aux"
y<-system(paste('bibtex' , reti))
z<-system(paste('pdflatex -halt-on-error', ret))
zz<-system(paste('pdflatex -halt-on-error', ret))
#code to generate excel files with fit
#library(purrr)
#fitu<-map(fit[c(1,6,7,9,13,14)], ~filter(.x,year> 1988))

# library(xlsx)
# wb <- createWorkbook()
# datas <- fitu#,5,6,7)]#,9,10,11)]
# sheetnames <- names(datas)#paste0("Sheet", seq_along(datas)) # or names(datas) if provided
# sheets <- lapply(sheetnames, createSheet, wb = wb)
# void <- Map(addDataFrame, datas, sheets)
# saveWorkbook(wb, file = "summaryresults_gadget_1.xlsx")
# #tools::texi2pdf("Gadgetbenchmark_run59_2018_2fv_june25_4report_2019_27may_ecocadiz2018_estesi_junio30.tex")
# fitu<-map(fit[c(15,16)], ~filter(.x,year> 1988))
# wb <- createWorkbook()
# datas <- fitu#,5,6,7)]#,9,10,11)]
# sheetnames <- names(datas)#paste0("Sheet", seq_along(datas)) # or names(datas) if provided
# sheets <- lapply(sheetnames, createSheet, wb = wb)
# void <- Map(addDataFrame, datas, sheets)
# saveWorkbook(wb, file = "summaryresults_gadget_2.xlsx")
# 
# wb <- createWorkbook()
# datas <- fit[17]$predator.prey%>%filter(year>1988)#,5,6,7)]#,9,10,11)]
# sheetnames <- names(datas)#paste0("Sheet", seq_along(datas)) # or names(datas) if provided
# sheets <- lapply(sheetnames, createSheet, wb = wb)
# void <- Map(addDataFrame, datas, sheets)
# saveWorkbook(wb, file = "summaryresults_gadget_3.xlsx")
setwd("..")

