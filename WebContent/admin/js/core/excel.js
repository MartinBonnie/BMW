// JScript 文件
var Excel = function() {
    this.initialize = function(Title, ColumnsNum, DataColumns, Data, AttTitle, TotalItem, TotleTitle, Num, ThirdTitle, ContantConsplan) {
        this.Title = Title; //excel标题
        this.ColumnsNum = ColumnsNum; //目录数量
        this.DataColumns = DataColumns; //二级目录
        this.Data = Data; //内容
        this.AttTitle = AttTitle; //检索条件
        this.TotalItem = TotalItem;
        this.FirstTitle = TotleTitle; //一级目录
        this.mergecellsNum = Num == null ? 1 : Num; //需要合并的列数
        this.ThirdTitle = ThirdTitle; //三级目录
        this.ContantConsplan = ContantConsplan; //内容中有需要合并内容
    }

    this.FormatToExcel= function() {
        if (this.Data == null || this.Data.length == 0) {
            return;
        }
        else {
            var xls;
            try {
                xls = new ActiveXObject("Excel.Application");
            }
            catch (e) {
                alert("要打印该表，您必须安装Excel电子表格软件，同时浏览器须使用“ActiveX 控件”，您的浏览器须允许执行控件。 请点击【帮助】了解浏览器设置方法！");
                return;
            }
            xls.visible = true;  //设置excel为可见
            var xlBook = xls.Workbooks.Add;
            var xlsheet = xlBook.Worksheets(1);
            //EXCEL标题
            xlsheet.Range(xlsheet.Cells(1, 1), xlsheet.Cells(1, this.ColumnsNum)).mergecells = true;
            xlsheet.Range(xlsheet.Cells(1, 1), xlsheet.Cells(1, this.ColumnsNum)).value = this.Title;
            xlsheet.Rows(1).RowHeight = 25;
            xlsheet.Rows(1).Font.Size = 14;
            xlsheet.Rows(1).Font.Name = "黑体";
            var sRow = 1;
            //检索条件
            if (this.AttTitle && this.AttTitle != null) {
                sRow++;
                xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(sRow, this.ColumnsNum)).mergecells = true;
                xlsheet.Cells(sRow, 1).Value = this.AttTitle;
                xlsheet.Rows(sRow).RowHeight = 25;
                xlsheet.Rows(sRow).Font.Size = 13;
                xlsheet.Rows(sRow).Font.Name = "黑体";
            }
            //一级目录
            if (this.FirstTitle && this.FirstTitle != null) {
                sRow++;
                var position = 1;
                for (var j = 0; j < this.FirstTitle.length; j++) {
                    var result = this.FirstTitle[j].split('|');
                    xlsheet.Range(xlsheet.Cells(sRow, position), xlsheet.Cells(sRow, position + parseInt(result[1]) - 1)).mergecells = true;
                    xlsheet.Cells(sRow, position).Value = result[0];
                    position = position + parseInt(result[1]);
                }
                xlsheet.Rows(sRow).RowHeight = 25;
                xlsheet.Rows(sRow).Font.Size = 13;
                xlsheet.Rows(sRow).Font.Name = "黑体";
            }

            var i = 0;
            //二级目录
            if (this.DataColumns && this.DataColumns != null) {
                sRow++;
                var position = 1;
                for (i = 1; i <= this.DataColumns.length; i++) {
                    var result = this.DataColumns[i - 1].split('|');
                    if (result.length > 1) {
                        xlsheet.Range(xlsheet.Cells(sRow, position), xlsheet.Cells(sRow, position + parseInt(result[1]) - 1)).mergecells = true;
                        xlsheet.Cells(sRow, position).Value = result[0];
                        position = position + parseInt(result[1]);
                    }
                    else {
                        xlsheet.Cells(sRow, i).Value = this.DataColumns[i - 1];
                    }
                }
            }
            if (this.ThirdTitle && this.ThirdTitle != null) {
                sRow++;
                //三级目录
                for (var k = 1; k <= this.ColumnsNum; k++) {
                    xlsheet.Cells(sRow, k).Value = this.ThirdTitle[k - 1];
                }
            }
            //内容
            var DataList = this.Data;
            var RowNum = DataList.length;
            var row;
            sRow++;
            var rindex = sRow;
            var cosplan = new Array(0, 0, 0, 0, 0);
            for (i = 0; i < RowNum; i++) {
                row = DataList[i];
                for (var w = 0; w < this.mergecellsNum; w++) {
                    //合并第一列相同项
                    if (i > 0 && xlsheet.Cells(rindex - 1 - cosplan[w], w + 1).Value == row[w]) {
                        xlsheet.Range(xlsheet.Cells(rindex - 1 - cosplan[w], w + 1), xlsheet.Cells(rindex, w + 1)).mergecells = true;
                        cosplan[w] += 1;

                    }
                    else {
                        cosplan[w] = 0;
                    }
                    xlsheet.Cells(rindex, w + 1).Value = row[w];
                    if ((w + 1) == this.mergecellsNum) {
                        rindex++;
                    }
                }
                //合并每周数据
                if (row.length < this.ColumnsNum && this.ContantConsplan == true) {
                    for (j = this.mergecellsNum; j < this.ColumnsNum; j++) {
                        if (j != this.mergecellsNum) {
                            xlsheet.Range(xlsheet.Cells(i + sRow, 2 * j - 2), xlsheet.Cells(i + sRow, 2 * j - 1)).mergecells = true;
                            xlsheet.Cells(i + sRow, 2 * j - 2).Value = row[j];
                        }
                        else {
                            xlsheet.Cells(i + sRow, j + 1).Value = row[j];
                        }
                    }
                }
                else {
                    for (j = this.mergecellsNum; j < this.ColumnsNum; j++) {
                        xlsheet.Cells(i + sRow, j + 1).NumberFormat = "@";
                        xlsheet.Cells(i + sRow, j + 1).Value = row[j];
                    }
                }
            }
            xlsheet.Columns.AutoFit;
            xlsheet.Range(xlsheet.Cells(1, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).HorizontalAlignment = -4108; //居中
            xlsheet.Range(xlsheet.Cells(1, 1), xlsheet.Cells(1, this.ColumnsNum)).VerticalAlignment = -4108;
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Font.Size = 10;
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Borders(1).Weight = 2; //设置顶边距
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Borders(2).Weight = 2; //设置底边距
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Borders(3).Weight = 2; //设置左边距
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Borders(4).Weight = 2; //设置右边距
            if (this.TotalItem && this.TotalItem != null) {
                sRow++;
                xlsheet.Cells(RowNum + sRow - 1, 1).Value = this.TotalItem;
                xlsheet.Range(xlsheet.Cells(RowNum + sRow - 1, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).mergecells = true;
                xlsheet.Range(xlsheet.Cells(RowNum + sRow - 1, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Font.Size = 12;
            }
            xls.UserControl = true;  //很重要,不能省略,不然会出问题 意思是excel交由用户控制
            xls = null;
            xlBook = null;
            xlsheet = null;
        }
    }

    this.FormatToExcelForArray= function() {
        if (this.Data == null || this.Data.length == 0) {
            return;
        }
        else {
            var xls;
            try {
                xls = new ActiveXObject("Excel.Application");
            }
            catch (e) {
                alert("要打印该表，您必须安装Excel电子表格软件，同时浏览器须使用“ActiveX 控件”，您的浏览器须允许执行控件。 请点击【帮助】了解浏览器设置方法！");
                return;
            }
            xls.visible = true;  //设置excel为可见
            var xlBook = xls.Workbooks.Add;
            var xlsheet = xlBook.Worksheets(1);
            xlsheet.Range(xlsheet.Cells(1, 1), xlsheet.Cells(1, this.ColumnsNum)).mergecells = true;
            xlsheet.Range(xlsheet.Cells(1, 1), xlsheet.Cells(1, this.ColumnsNum)).value = this.Title;
            xlsheet.Rows(1).RowHeight = 25;
            xlsheet.Rows(1).Font.Size = 15;
            xlsheet.Rows(1).Font.Name = "黑体";
            var sRow = 1;
            if (this.AttTitle && this.AttTitle != null) {
                sRow++;
                xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(sRow, this.ColumnsNum)).mergecells = true;
                xlsheet.Cells(sRow, 1).Value = this.AttTitle;
                xlsheet.Rows(sRow).RowHeight = 25;
                xlsheet.Rows(sRow).Font.Size = 13;
                xlsheet.Rows(sRow).Font.Name = "黑体";
            }
            sRow++;
            var i = 0;
            for (i = 1; i <= this.ColumnsNum; i++) {
                xlsheet.Cells(sRow, i).Value = this.DataColumns[i - 1];

            }
            var DataList = this.Data;
            var RowNum = DataList.length;
            var row;
            sRow++;
            for (i = 0; i < RowNum; i++) {
                row = DataList[i];
                for (j = 0; j < this.ColumnsNum; j++) {
                    xlsheet.Cells(i + sRow, j + 1).NumberFormat = "@";
                    xlsheet.Cells(i + sRow, j + 1).Value = row[j];
                }
            }
            xlsheet.Columns.AutoFit;
            xlsheet.Range(xlsheet.Cells(1, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).HorizontalAlignment = -4108; //居中
            xlsheet.Range(xlsheet.Cells(1, 1), xlsheet.Cells(1, this.ColumnsNum)).VerticalAlignment = -4108;
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Font.Size = 10;
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Borders(1).Weight = 2; //设置顶边距
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Borders(2).Weight = 2; //设置底边距
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Borders(3).Weight = 2; //设置左边距
            xlsheet.Range(xlsheet.Cells(sRow, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Borders(4).Weight = 2; //设置右边距
            if (this.TotalItem && this.TotalItem != null) {
                sRow++;
                xlsheet.Cells(RowNum + sRow - 1, 1).Value = this.TotalItem;
                xlsheet.Range(xlsheet.Cells(RowNum + sRow - 1, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).mergecells = true;
                xlsheet.Range(xlsheet.Cells(RowNum + sRow - 1, 1), xlsheet.Cells(RowNum + sRow - 1, this.ColumnsNum)).Font.Size = 12;
            }
            xls.UserControl = true;  //很重要,不能省略,不然会出问题 意思是excel交由用户控制
            xls = null;
            xlBook = null;
            xlsheet = null;
        }
    }
	
    this.ReportConvertDateTimeToString= function(DateTime) {
        if (DateTime != null) {
            var Year = 0;
            var Month = 0;
            var Day = 0;
            var Minutes = 0;
            var Hour = 0;
            var Second = 0;
            try {
                Year = DateTime.getYear();
                Month = DateTime.getMonth() + 1;
                Day = DateTime.getDate();
                Minutes = DateTime.getMinutes();
                Hour = DateTime.getHours();
                Second = DateTime.getSeconds();
            }
            catch (e) {
                return DateTime;
            }
            var DateTimeString = "";
            DateTimeString = Year + "-";
            if (Month < 10) { DateTimeString = DateTimeString + "0" + Month + "-"; }
            else { DateTimeString = DateTimeString + Month + "-"; }
            if (Day < 10) { DateTimeString = DateTimeString + "0" + Day + " "; }
            else { DateTimeString = DateTimeString + Day + " "; }
            if (Hour < 10) { DateTimeString = DateTimeString + "0" + Hour + ":"; }
            else { DateTimeString = DateTimeString + Hour + ":"; }
            if (Minutes < 10) { DateTimeString = DateTimeString + "0" + Minutes + ":"; }
            else { DateTimeString = DateTimeString + Minutes + ":"; }
            if (Second < 10) { DateTimeString = DateTimeString + "0" + Second; }
            else { DateTimeString = DateTimeString + Second; }
            return DateTimeString;
        }
        else { return "无"; }
    }
}

