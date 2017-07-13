$(function () {
    $("#jqGrid").jqGrid({
        url: '../yl/hospital/list',
        datatype: "json",
        colModel: [			
			{ label: 'ID', name: 'id', width: 30, key: true },
			{ label: '医院名', name: 'name', width: 60 },
            { label: '医院负责人', name: 'principal', width: 60 },
            { label: '医院地址', name: 'address', width: 60 },
            { label: '业务范围', name: 'businessScope', width: 60 },
            { label: '电话', name: 'phone', width: 60 },
            { label: '手机号', name: 'mobile', width: 60 },
            { label: '医院组织', name: 'orgName', width: 60 },
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
            idKey: "menuId",
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
		hospital: {},
		organization:{}
	},
	methods: {
        getOrg: function(orgId){
            //加载机构树
            $.get("../yl/organization/select", function(r){
                ztree = $.fn.zTree.init($("#menuTree"), setting, r.menuList);
                var node = ztree.getNodeByParam("menuId", vm.menu.parentId);
                ztree.selectNode(node);

                vm.menu.parentName = node.name;
            })
        },
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.hospital = {};
		},
		update: function () {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			
			$.get("../yl/hospital/info/"+id, function(r){
                vm.showList = false;
                vm.title = "修改";
                vm.hospital = r.hospital;
                vm.organization = r.organization;
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
				    url: "../yl/hospital/delete",
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
			var url = vm.hospital.id == null ? "../yl/hospital/save" : "../yl/hospital/update";
			$.ajax({
				type: "POST",
			    url: url,
                contentType: "application/json",
			    data: JSON.stringify(vm.hospital),
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