$(function () {
    $("#jqGrid").jqGrid({
        url: '../yl/specialist/list',
        datatype: "json",
        colModel: [			
			{ label: 'ID', name: 'id', width: 30, key: true },
			{ label: '专家名', name: 'name', width: 60 },
            { label: '科室名', name: 'departmentName', width: 60 },
            { label: '医院名', name: 'hosName', width: 60 },
            { label: '机构名', name: 'orgName', width: 60 },
            { label: '职称', name: 'title', width: 60 },
            { label: '电话', name: 'phone', width: 60 },
            { label: '手机号', name: 'mobile', width: 60 },
            { label: '地址', name: 'address', width: 60 },
			{ label: '备注', name: 'remark', width: 80 }
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

var setting = {
    data: {
        simpleData: {
            enable: true,
            idKey: "id",
            pIdKey: "parentId",
            rootPId: -1
        },
        key: {
            url:"nourl"
        }
    }
};
var ztree;

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			key: null
		},
		showList: true,
		title: null,
        specialist: {},
        department: {},
		hospital: {},
		organization:{},
		ylTree:{
            name:null,
            id:1,
            type:1,
            orderNum:0
		}
	},
	methods: {
        getYlTree: function(id){
            //加载机构树
            $.get("../yl/department/select", function(r){
                ztree = $.fn.zTree.init($("#menuTree"), setting, r.ylList);
                var node = ztree.getNodeByParam("id", vm.ylTree.id);
                ztree.selectNode(node);

                vm.ylTree.name = node.name;
            })
        },
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.specialist = {};
            vm.getYlTree();
		},
		update: function () {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			
			$.get("../yl/specialist/info/"+id, function(r){
                vm.showList = false;
                vm.title = "修改";
                vm.specialist = r.specialist;
                vm.department = r.department;
                vm.hospital = r.hospital;
                vm.organization = r.organization;
				vm.ylTree.id = r.department.id;
                vm.getYlTree();
            });
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: "../yl/specialist/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								vm.reload();
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		saveOrUpdate: function (event) {
			var url = vm.hospital.id == null ? "../yl/specialist/save" : "../yl/specialist/update";
			$.ajax({
				type: "POST",
			    url: url,
                contentType: "application/json",
			    data: JSON.stringify(vm.specialist),
			    success: function(r){
			    	if(r.code === 0){
						alert('操作成功', function(index){
							vm.reload();
						});
					}else{
						alert(r.msg);
					}
				}
			});
		},
        menuTree: function(){
            layer.open({
                type: 1,
                offset: '50px',
                skin: 'layui-layer-molv',
                title: "选择科室",
                area: ['300px', '450px'],
                shade: 0,
                shadeClose: false,
                content: jQuery("#menuLayer"),
                btn: ['确定', '取消'],
                btn1: function (index) {
                    var node = ztree.getSelectedNodes();
                    //选择上级菜单
                    vm.ylTree.id = node[0].id;
                    vm.ylTree.name = node[0].name;

                    layer.close(index);
                }
            });
        },
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                postData:{'name': vm.q.name},
                page:page
            }).trigger("reloadGrid");
		}
	}
});