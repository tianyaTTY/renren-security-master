$(function () {
    $("#jqGrid").jqGrid({
        url: '../yl/organization/list',
        datatype: "json",
        colModel: [			
			{ label: 'ID', name: 'id', width: 30, key: true },
			{ label: '机构名称', name: 'name', width: 60 },
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

var vm = new Vue({
	el:'#rrapp',
	data:{
		q:{
			key: null
		},
		showList: true,
		title: null,
		organization: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.organization = {};
		},
		update: function () {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			
			$.get("../yl/organization/info/"+id, function(r){
                vm.showList = false;
                vm.title = "修改";
                vm.organization = r.organization;
            });
		},
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的组织信息？此操作将同时删除组织下面所有的医院，科室和专家信息！', function(){
				$.ajax({
					type: "POST",
				    url: "../yl/organization/delete",
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
			var url = vm.organization.id == null ? "../yl/organization/save" : "../yl/organization/update";
			$.ajax({
				type: "POST",
			    url: url,
                contentType: "application/json",
			    data: JSON.stringify(vm.organization),
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