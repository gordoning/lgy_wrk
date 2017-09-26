import xlrd
import xlwt

workbook = xlrd.open_workbook('abc.xls')

table = workbook.sheets()[0]

nrows = table.nrows

ncols = table.ncols

for i in range(3,nrows):
      print(int(table.row_values(i)[1]))


wbk = xlwt.Workbook()

sheet = wbk.add_sheet('我想要的表格')

# sheet.write(1, 1, '13616187656')  # 第0行第一列写入内容
# sheet.write(1, 2, '发券数量')  # 第0行第一列写入内容
# wbk.save('test.xls')

with open('lgy.txt','a') as f:
    f.write('13616187656')
    f.write(',')
    f.flush()
