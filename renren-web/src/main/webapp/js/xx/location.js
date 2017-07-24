// 百度地图API功能
var map = new BMap.Map("allmap");    // 创建Map实例
map.centerAndZoom(new BMap.Point(107.483829,38.189151), 11);  // 初始化地图,设置中心点坐标和地图级别
map.setCurrentCity("鄂托克前旗");          // 设置地图显示的城市 此项是必须设置的
map.addControl(new BMap.NavigationControl());               // 添加平移缩放控件
map.addControl(new BMap.ScaleControl());                    // 添加比例尺控件
map.addControl(new BMap.OverviewMapControl());              //添加缩略地图控件
map.enableScrollWheelZoom();                            //启用滚轮放大缩小
map.addControl(new BMap.MapTypeControl());          //添加地图类型控件

//加载数据库中保存的数据
$.ajax({
    url:"../xx/location/select",
    // data: {"category":1},
    type:"post",
    dataType: 'json',
    success:function(data){
        for(var i=0;i<data.length;i++){
            addMarker(data[i].id,data[i].name, data[i].address,data[i].contact,data[i].longitude,data[i].latitude,data[i].category,data[i].createDate);
        }
    },
    error: function(data){
        alert("查询幼儿园失败！");
    }
});

function addMarker(id,name,address,contact,longitude,latitude,category,createDate) {
    var p = new BMap.Point(longitude,latitude);
    var marker = new BMap.Marker(p);//创建一个标准
    map.addOverlay(marker);//将标注增加到地图
    //marker.enableDragging();//设置标注可移动
    var img;
    switch (category){
        case 1:
            img = '../img/zhengfu.png';
            break;
        case 2:
            img = '../img/eryuan.png';
            break;
        case 3:
            img = '../img/fandian.png';
            break;
        case 4:
            img = '../img/jiudian.png';
            break;
        case 5:
            img = '../img/shouyi.png';
            break;
    }
    var icon = new BMap.Icon(img,  new BMap.Size(25, 25), {
        anchor: new BMap.Size(10, 22)
    });
    marker.setIcon(icon);//将图标放到容器中
    addClickHandler(marker,id,name,address,contact,longitude,latitude,createDate);
}

var opts = {
    width : 350,     // 信息窗口宽度
    height: 400,     // 信息窗口高度
    title : "幼儿园" , // 信息窗口标题
    enableMessage:true//设置允许信息窗发送短息
};
function addClickHandler(marker,id,name,address,contact,longitude,latitude,createDate){
    marker.addEventListener("click",function(e){
        //var content1 = "<div style='margin-bottom:15px'><label>编号</label><input type='text' id='id' name='id' disabled='disabled' style='border-color:#8a6d3b;-webkit-box-shadow:inset 0 1px 1px rgba(0,0,0,.075);box-shadow:inset 0 1px 1px rgba(0,0,0,.075)' value="+id+"></div>"
        var content="<br/><input type='hidden' name='id' id='id' value="+id+"><input type='hidden' name='createDate' id='createDate' value="+createDate+">"+
                "名    称：<input type='text' id='name' name='name' value="+name+"><br/><br/>"+
                "地    址：<input type='text' id='address' name='address' value="+address+"><br/><br/>"+
                "联系方式：<input type='text' id='contact' name='contact' value="+contact+"><br/><br/>"+
                "经    度：<input type='text' id='longitude' name='longitude' value="+longitude+"><br/><br/>"+
                "纬    度：<input type='text' id='latitude' name='latitude' value="+latitude+"><br/><br/>"+
                "<button onclick='saveOrUpdate()'>确定</button><button onclick='cancel()'>取消</button>";
        openInfo(content,e);//调用绘制
    });
}
function openInfo(content,e){
    var p = e.target;
    var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
    var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow,point); //开启信息窗口
}
function saveOrUpdate() {
    if ($("#id").val()==null){
        save();
    }else{
        update();
    }
}
function save() {
    var url = "../xx/location/save";
    var myDate = new Date().toLocaleDateString();
    $.ajax({
        url:url,
        type:"post",
        data:{"id":$("#id").val(),"name":$("#name").val(),"address":$("#address").val(),"contact":$("#contact").val(),"longitude":$("#longitude").val(),"latitude":$("#latitude").val(),"updateDate":myDate,"createDate":myDate},
        success:function(data){
            alert("新增幼儿园成功！");
            cancel();
        },
        error: function(data){
            alert("新增幼儿园失败！");
            cancel();
        }
    });
}
function update() {
    var url = "../xx/location/update";
    var myDate = new Date().toLocaleDateString();
    $.ajax({
        url:url,
        type:"post",
        data:{"id":$("#id").val(),"name":$("#name").val(),"address":$("#address").val(),"contact":$("#contact").val(),"longitude":$("#longitude").val(),"latitude":$("#latitude").val(),"updateDate":myDate},
        success:function(data){
            alert("修改幼儿园信息成功！");
            cancel();
        },
        error: function(data){
            alert("修改幼儿园信息失败！");
            cancel();
        }
    });
}
function cancel() {
    map.closeInfoWindow();
}

