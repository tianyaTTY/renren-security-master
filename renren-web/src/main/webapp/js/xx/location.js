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
    url:'../xx/location/select',
    data: {"category":1},
    type:"get",
    success:function(json){
        alert(json);
        for(var i=0;i<json.length;i++){
            addMarker(json[i].id,json[i].name, json[i].address,json[i].contact,json[i].longitude,json[i].latitude);
        }
    },
    error: function(json){
        alert("查询幼儿园失败！");
    }
});

function addMarker(id,name,address,contact,longitude,latitude) {
    var p = new BMap.Point(longitude,latitude);
    var marker = new BMap.Marker(p);//创建一个标准
    map.addOverlay(marker);//将标注增加到地图
    marker.enableDragging();//设置标注可移动
    var icon = new BMap.Icon('../img/zhengfu.png',  new BMap.Size(25, 25), {
        anchor: new BMap.Size(10, 22)
    });
    marker.setIcon(icon);//将图标放到容器中
    addClickHandler(marker,id,name,address,contact,longitude,latitude);
}
/*
var p = new BMap.Point('107','38');
var marker = new BMap.Marker(p);//创建一个标准
map.addOverlay(marker);//将标注添加到地图
marker.enableDragging();//设置标注可以移动
var icon = new BMap.Icon('../img/zhengfu.png',  new BMap.Size(25, 25), {
    anchor: new BMap.Size(10, 22)
});
marker.setIcon(icon); //自定义图标，如果不需要自定义，可以删掉
*/

var opts = {
    width : 350,     // 信息窗口宽度
    height: 200,     // 信息窗口高度
    title : "信息窗口" , // 信息窗口标题
    enableMessage:true//设置允许信息窗发送短息
};
function addClickHandler(marker,id,name,address,contact,longitude,latitude){
    marker.addEventListener("click",function(e){
        var content="<p>编号:"+id+"</p>"+
            "<p>名称:"+name+"</p>"+
            "<p>地址:"+address+"</p>"+
            "<p>联系方式:"+contact+"</p>"+
            "<p>经度:"+longitude+"</p>"+
            "<p>纬度:"+latitude+"</p>";
        openInfo(content,e);//调用绘制
    });
}
function openInfo(content,e){
    var p = e.target;
    var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
    var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow,point); //开启信息窗口
}

/*
$(function () {
    $("#jqGrid").jqGrid({
        url: '../xx/location/list',
        datatype: "json",
        colModel: [
            { label: 'ID', name: 'id', width: 30, key: true },
            { label: '备注', name: 'name', width: 80 }
        ],
        viewrecords: true,
        height: 385,
        rowNum: 10,
        rowList : [10,30,50],
        rownumbers: true,
        rownumWidth: 25,
        autowidth:true,
        multiselect: true,
        pager: "#jqGridPager",
        jsonReader : {
            root: "page.list",
            page: "page.currPage",
            total: "page.totalPage",
            records: "page.totalCount"
        },
        prmNames : {
            page:"page",
            rows:"limit",
            order: "order"
        },
        gridComplete:function(){
            //隐藏grid底部滚动条
            $("#jqGrid").closest(".ui-jqgrid-bdiv").css({ "overflow-x" : "hidden" });
        }
    });
});

var vm = new Vue({
    el:'#rrapp',
    data:{
        q:{
            key: null
        },
        showList: true,
        title: null,
        location: {}
    },
    methods: {
        reash:function(){
            alert(2);
        }
    }
});*/
