$(function () {
    $("#jqGrid").jqGrid({
        url: baseURL + 'goods/goods/list',
        datatype: "json",
        colModel: [			
			{ label: 'id', name: 'id', index: 'id', width: 50, key: true },
			{ label: '商品标题', name: 'goodsTitle', index: 'goods_title', width: 80 }, 			
			{ label: '商品图片', name: 'goodsImg', index: 'goods_img', width: 80 }, 			
			{ label: '商品详情介绍', name: 'goodsDetail', index: 'goods_detail', width: 80 }, 			
			{ label: '商品库存,-1表示没有限制', name: 'goodsStock', index: 'goods_stock', width: 80 }, 			
			{ label: '商品现最小价格', name: 'goodsMinPrice', index: 'goods_min_price', width: 80 }, 			
			{ label: '商品现最大价格', name: 'goodsMaxPrice', index: 'goods_max_price', width: 80 }, 			
			{ label: '原最小价格', name: 'orgMinPrice', index: 'org_min_price', width: 80 }, 			
			{ label: '原最大价格', name: 'orgMaxPrice', index: 'org_max_price', width: 80 }, 			
			{ label: '所在地', name: 'location', index: 'location', width: 80 }, 			
			{ label: '运费 0 为免运费', name: 'deliveryFree', index: 'delivery_free', width: 80 }, 			
			{ label: '付款人数', name: 'payCount', index: 'pay_count', width: 80 }, 			
			{ label: '一级分类ID', name: 'oneCategoryId', index: 'one_category_id', width: 80 }, 			
			{ label: '二级分类ID', name: 'twoCategoryId', index: 'two_category_id', width: 80 }, 			
			{ label: '三级分类ID', name: 'threeCategoryId', index: 'three_category_id', width: 80 }, 			
			{ label: '品牌表的ID', name: 'brandId', index: 'brand_id', width: 80 }, 			
			{ label: '上下架状态：0下架1上架', name: 'publishStatus', index: 'publish_status', width: 80 }, 			
			{ label: '审核状态：0未审核，1已审核', name: 'auditStatus', index: 'audit_status', width: 80 }, 			
			{ label: '所属卖家id', name: 'sellerId', index: 'seller_id', width: 80 }			
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
		showList: true,
		title: null,
		goods: {}
	},
	methods: {
		query: function () {
			vm.reload();
		},
		add: function(){
			vm.showList = false;
			vm.title = "新增";
			vm.goods = {};
		},
		update: function (event) {
			var id = getSelectedRow();
			if(id == null){
				return ;
			}
			vm.showList = false;
            vm.title = "修改";
            
            vm.getInfo(id)
		},
		saveOrUpdate: function (event) {
			var url = vm.goods.id == null ? "goods/goods/save" : "goods/goods/update";
			$.ajax({
				type: "POST",
			    url: baseURL + url,
                contentType: "application/json",
			    data: JSON.stringify(vm.goods),
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
		del: function (event) {
			var ids = getSelectedRows();
			if(ids == null){
				return ;
			}
			
			confirm('确定要删除选中的记录？', function(){
				$.ajax({
					type: "POST",
				    url: baseURL + "goods/goods/delete",
                    contentType: "application/json",
				    data: JSON.stringify(ids),
				    success: function(r){
						if(r.code == 0){
							alert('操作成功', function(index){
								$("#jqGrid").trigger("reloadGrid");
							});
						}else{
							alert(r.msg);
						}
					}
				});
			});
		},
		getInfo: function(id){
			$.get(baseURL + "goods/goods/info/"+id, function(r){
                vm.goods = r.goods;
            });
		},
		reload: function (event) {
			vm.showList = true;
			var page = $("#jqGrid").jqGrid('getGridParam','page');
			$("#jqGrid").jqGrid('setGridParam',{ 
                page:page
            }).trigger("reloadGrid");
		}
	}
});