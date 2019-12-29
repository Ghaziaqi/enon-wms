var formatter = {
    time: function(value, row, index){
        if( value != null ){
            value *= 1000;
            return moment(value).format('YYYY-MM-DD HH:mm');  
        }else{
            return '-:-';
        }
    },
    operate: function(value, row, index){
        return '<button class="btn btn-sm btn-success mg-r-xs" type="button" onclick="Table.methods.edit(' + row.id + ')" ><i class="fa fa-edit" > </i><span class="hidden-xs hidden-sm">编辑</span></button><button class="btn btn-sm btn-danger" type="button" onclick="Table.methods.del(' + row.id + ')"><i class="fa fa-trash" > </i><span class="hidden-xs hidden-sm">删除</span></button>';
    },
    print: function(value, row, index){
        return '<button class="btn btn-sm btn-primary mg-r-xs" type="button" onclick="Table.methods.print(' + row.id + ')" ><i class="fa fa-print" > </i><span class="hidden-xs hidden-sm">打印</span></button>  <button class="btn btn-sm btn-success mg-r-xs" type="button" onclick="Table.methods.edit(' + row.id + ')" ><i class="fa fa-edit" > </i><span class="hidden-xs hidden-sm">编辑</span></button><button class="btn btn-sm btn-danger" type="button" onclick="Table.methods.del(' + row.id + ')"><i class="fa fa-trash" > </i><span class="hidden-xs hidden-sm">删除</span></button>';        
    },
    head_img: function(value, row, index){
        if( value != null ){
            return ' <a href="'+value+'" target="_blank"> <img src="'+value+'" alt="" width="20" > </a> ';
        }else{
            return ' <a href="" target="_blank"> <img src="/static/admin/img/about.png" alt="" width="20" > </a> ';
        }
    },
    status: function (value, row, index){
        return value == 0 ? '正常' : '禁用';
    },
    icon: function (value, row, index) {
        return '<i class="fa ' + value + '"></i>'
    }

};

// 数组转json
function arrayToJson(data){
   var tempObject = {};
   data.forEach(function(val,index,array){
       tempObject[val.name] = val.value;
   });
   return tempObject;
}

function in_array(search,array){
    for(var i in array){
        if(array[i]==search){
            return true;
        }
    }
    return false;
}