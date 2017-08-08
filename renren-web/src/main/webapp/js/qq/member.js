$(function () {
    $("#jqGrid").jqGrid({
        url: '../qq/member/list',
        datatype: "json",
        colModel: [
            { label: '用户ID', name: 'id', width: 45, key: true },
            { label: '用户名', name: 'username', width: 75 },
            { label: '邮箱', name: 'email', width: 90 },
            { label: '姓名', name: 'name', width: 75 },
            { label: '身份证号', name: 'identityId', width: 75 },
            { label: '手机号', name: 'mobile', width: 100 },
            { label: '注册时间', name: 'registerDate', width: 80}
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
            username: null
        },
        showList: true,
        title:null,
        roleList:{},
        member:{}
    },
    methods: {
        query: function () {
            vm.reload();
        },
        add: function(){
            vm.showList = false;
            vm.title = "新增";
            vm.member = {};
        },
        update: function () {
            var memberId = getSelectedRow();
            if(memberId == null){
                return ;
            }

            vm.showList = false;
            vm.title = "修改";

            vm.getMember(memberId);
        },
        del: function () {
            var ids = getSelectedRows();
            if(ids == null){
                return ;
            }

            confirm('确定要删除选中的记录？', function(){
                $.ajax({
                    type: "POST",
                    url: "../qq/member/delete",
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
            var url = vm.member.id == null ? "../qq/member/save" : "../qq/member/update";
            $.ajax({
                type: "POST",
                url: url,
                contentType: "application/json",
                data: JSON.stringify(vm.member),
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
        getMember: function(memberId){
            $.get("../qq/member/info/"+memberId, function(r){
                vm.member = r.member;
                if(r.member.notificationFlag == 1){
                    $("#switch-size").checked=true;
                }else{
                    $("#switch-size").checked=false;
                }
            });
        },
        reload: function (event) {
            vm.showList = true;
            var page = $("#jqGrid").jqGrid('getGridParam','page');
            $("#jqGrid").jqGrid('setGridParam',{
                postData:{'username': vm.q.username},
                page:page
            }).trigger("reloadGrid");
        }
    }
});