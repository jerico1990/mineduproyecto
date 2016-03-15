<?php
/**
* menu view
*/

$action_url = 'http://localhost/forum/backend/web/index.php?r=menu/';
?>

	<div class="row action">
		<div class="col-lg-6">
					<div class="btn-group" role="group">
						<button type="button" class="btn btn-default" data-toggle="modal" data-target="#modal-add-id">新建</button>
						<button type="button" class="btn btn-default">删除</button>
						<button type="button" class="btn btn-default">导出</button>
					</div>
				</div>
				<div class="col-lg-6 form-inline">
					<div class="form-group">
						<label>关键字</label>
						<input type="text" class="form-control">
						<button class="btn btn-default">搜索</button>
						<button class="btn btn-default">高级搜索</button>
					</div>
				</div>
			</div>
			<div class="row modal-boxes">
				<div class="modal" id="modal-add-id" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
								<h4 class="modal-title">菜单添加</h4>
							</div>
							<form class="form-horizontal" action="<?= $action_url.'add' ?>" method="post">
								<div class="modal-body">
									<div class="form-group">
										<label class="col-sm-2 control-label">上级分类</label>
										<div class="col-sm-6">
											<select class="form-control" name="parent_id">
												<option value="">请选择一项</option>
												<option value="1">系统设置</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">名称：</label>
										<div class="col-sm-6">
											<input class="form-control"  type="text" name="name">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">备注：</label>
										<div class="col-sm-6">
											<textarea class="form-control" rows="3" name="menu_comment"></textarea>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary submit">添加</button>
								</div>
							</form>
						</div>
					</div>
				</div>
				<div class="modal" id="modal-update-id" role="dialog">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
								<h4 class="modal-title">菜单编辑</h4>
							</div>
							<form class="form-horizontal">
								<div class="modal-body">
									<div class="form-group">
										<label class="col-sm-2 control-label">上级分类</label>
										<div class="col-sm-6">
											<select class="form-control" name="category">
												<option value="">请选择一项</option>
												<option value="1">系统设置</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">名称：</label>
										<div class="col-sm-6">
											<input class="form-control"  type="text" name="name">
										</div>
									</div>
									<div class="form-group">
										<label class="col-sm-2 control-label">备注：</label>
										<div class="col-sm-6">
											<textarea class="form-control" rows="3" name="name"></textarea>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
									<button type="button" class="btn btn-primary submit">添加</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 action">
					<table class="table table-bordered table-hover">
						<thead>
							<tr>
								<th><input type="checkbox" name="checkbox"></th>
								<th>序号</th></th>
								<th>名称</th>
								<th>级别</th>
								<th>添加日期</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="checkbox" name="id[]"></td>
								<td>1</td>
								<td>菜单管理</td>
								<td>二级</td>
								<td>2015-04-12 12:13:56</td>
								<td><a data-target="#modal-update-id" data-toggle="modal" href="#">编辑</a>&nbsp;&nbsp;<a href="#">删除</a></td>
							</tr>
						</tbody>
					</table>
					<nav>
						<ul class="pagination">
							<li><a href="#"><span>&laquo;</span></a></li>
							<li class="active"><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#"><span>&raquo;</span></a></li>
						</ul>
					</nav>		
				</div>
			</div>
