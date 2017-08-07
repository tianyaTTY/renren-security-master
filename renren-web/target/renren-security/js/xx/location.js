// 百度地图API功能
var map = new BMap.Map("allmap");    // 创建Map实例
map.centerAndZoom(new BMap.Point(107.483829,38.189151), 12);  // 初始化地图,设置中心点坐标和地图级别
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
            addMarker(data[i].id,data[i].name, data[i].address,data[i].contact,data[i].longitude,data[i].latitude,data[i].category,data[i].phone);
        }
    },
    error: function(data){
        alert("查询幼儿园失败！");
    }
});

function addMarker(id,name,address,contact,longitude,latitude,category,phone) {
    var p = new BMap.Point(longitude,latitude);
    var marker = new BMap.Marker(p);//创建一个标准
    map.addOverlay(marker);//将标注增加到地图
    marker.enableDragging();//设置标注可移动
    var img;
    var title;
    switch (category){
        case 1:
            img = '../img/zhengfu.png';
            title = "政府部门";
            break;
        case 2:
            img = '../img/eryuan.png';
            title = "幼儿园";
            break;
        case 3:
            img = '../img/fandian.png';
            title = "饭店";
            break;
        case 4:
            img = '../img/jiudian.png';
            title = "酒店";
            break;
        case 5:
            img = '../img/shouyi.png';
            title = "兽医点";
            break;
    }
    var icon = new BMap.Icon(img,  new BMap.Size(25, 25), {
        anchor: new BMap.Size(10, 22)
    });
    marker.setIcon(icon);//将图标放到容器中
    //marker.remove();
    addClickHandler(marker,id,name,address,contact,title,category,phone);
}

var opts = {
    width : 0,     // 信息窗口宽度350
    height: 0,     // 信息窗口高度400
    title : "幼儿园" , // 信息窗口标题
    enableMessage:true//设置允许信息窗发送短息
};
var curMarker;
function addClickHandler(marker,id,name,address,contact,title,category,phone){
    marker.addEventListener("click",function(e){
        var content="<br/><input type='hidden' name='id' id='id' value="+id+">"+
                "<input type='hidden' name='lng' id='lng' value="+e.point.lng+"><input type='hidden' name='lat' id='lat' value="+e.point.lat+"><input type='hidden' name='category' id='category' value="+category+">"+
                "<form class='form-horizontal'><div class='form-group'><div class='col-sm-2 control-label'>名称</div><div class='col-sm-10'><input type='text' class='form-control' placeholder='名称' id='name' name='name' value="+name+"></div></div>"+
                "<div class='form-group'><div class='col-sm-2 control-label'>地址</div><div class='col-sm-10'><input type='text' id='address' class='form-control' placeholder='地址' name='address' value="+address+"></div></div>"+
                "<div class='form-group'><div class='col-sm-2 control-label'>电话</div><div class='col-sm-10'><input type='text' id='contact' class='form-control' placeholder='电话' name='contact' value="+contact+"></div></div>"+
                "<div class='form-group'><div class='col-sm-2 control-label'>手机号</div><div class='col-sm-10'><input type='text' id='phone' class='form-control' placeholder='手机号' name='phone' value="+phone+"></div></div></form>"+
                "<div class='form-group'><div class='col-sm-2 control-label'></div><input type='button' class='btn btn-primary' onclick='saveOrUpdate()' value='确定'/>&nbsp;&nbsp;<input type='button' class='btn btn-warning' onclick='cancel()' value='返回'/>&nbsp;&nbsp;"+
                "<input type='button' class='btn btn-warning' style='background-color:#1ab394;border-color:#1ab394;color:#FFF' onclick='del()' value='删除'/></div>";
        curMarker = marker;
        openInfo(content,e,title);//调用绘制
    });
}
function openInfo(content,e,title){

    opts.title=title;
    var p = e.target;
    var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
    var infoWindow = new BMap.InfoWindow(content,opts);  // 创建信息窗口对象
    map.openInfoWindow(infoWindow,point); //开启信息窗口
}
function saveOrUpdate() {
    var regBox = {
        regEmail : /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/,//邮箱
        regName : /^[a-z0-9_-]{3,16}$/,//用户名
        regMobile : /^0?1[3|4|5|8][0-9]\d{8}$/,//手机
        regTel : /^0[\d]{2,3}-[\d]{7,8}$/
    }
    // var tflag = regBox.regTel.test($("#contact").val());
    var nameFlag = isStrNull($("#name").val());//检查名称是否为空
    var addFlag = isStrNull($("#address").val());//检查地址是否为空
    var telFlag = isStrNull($("#contact").val());//检查电话是否为空
    var phoneFlag = isStrNull($("#phone").val());//检查手机号是否为空
    var telFlag2 = true;//检查电话格式
    var phoneFlag2 = true;//检查手机号码格式
    if(!telFlag){
        if(!regBox.regTel.test($("#contact").val())){
            telFlag2 = false;
        }
    }
    if(!phoneFlag){
        if(!regBox.regMobile.test($("#phone").val())){
            phoneFlag2 = false;
        }
    }
    var contactFlag = telFlag&&phoneFlag;
    if (!nameFlag&&!addFlag&&!contactFlag){
        if (isStrNull($("#id").val())){
            save();
        }else{
            update();
        }
    }else{
        var msg="";
        if(nameFlag){
            msg = "名称信息必填！";
        }
        if(addFlag){
            msg += "地址必填！";
        }
        if(contactFlag){
            msg += "联系方式必填一个！";
        }
        if(!telFlag2){
            msg += "电话格式不对！";
        }
        if(!phoneFlag2){
            msg += "手机号码格式不对！";
        }
        alert(msg);
    }
}
function save() {
    var url = "../xx/location/save";
    var myDate = new Date().toLocaleDateString();
    $.ajax({
        url:url,
        type:"post",
        data:{"id":$("#id").val(),"name":$("#name").val(),"address":$("#address").val(),"contact":$("#contact").val(),"phone":$("#phone").val(),"longitude":$("#lng").val(),"latitude":$("#lat").val(),"updateDate":myDate,"createDate":myDate,"category":$("#category").val()},
        success:function(data){
            alert("新增成功！");
            cancel();
        },
        error: function(data){
            alert("新增失败！");
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
        data:{"id":$("#id").val(),"name":$("#name").val(),"address":$("#address").val(),"contact":$("#contact").val(),"phone":$("#phone").val(),"longitude":$("#lng").val(),"latitude":$("#lat").val(),"updateDate":myDate},
        success:function(data){
            alert("修改成功！");
            cancel();
        },
        error: function(data){
            alert("修改失败！");
            cancel();
        }
    });
}
function del() {
    if(isStrNull($("#id").val())){
        curMarker.remove();
        cancel();
    }else{
        confirm('确定要删除吗？', function(){
            $.ajax({
                url:"../xx/location/delete",
                type:"post",
                data:{"id":$("#id").val()},
                success:function(data){
                    alert("删除成功！");
                    curMarker.remove();
                    cancel();
                },
                error: function(data){
                    alert("删除失败！");
                    cancel();
                }
            });
        });
    }
}
function cancel() {
    map.closeInfoWindow();
}
function addEryuan() {
    addMarker('','','','','107.48','38.189',2,'');
}
function addShouyi() {
    addMarker('','','','','107.48','38.189',5,'');
}
function addJiudian() {
    addMarker('','','','','107.48','38.189',4,'');
}
function addFandian() {
    addMarker('','','','','107.48','38.189',3,'');
}
function addZhengfu() {
    addMarker('','','','','107.48','38.189',1,'');
}
function isStrNull(str) {
    if(str==null||str==""){
        return true;
    }else{
        return false;
    }
}
function reload() {
    location.reload();
}
