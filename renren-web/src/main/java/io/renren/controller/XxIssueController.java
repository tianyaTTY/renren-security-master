package io.renren.controller;

import io.renren.annotation.SysLog;
import io.renren.entity.XxIssueEntity;
import io.renren.service.XxIssueService;
import io.renren.utils.PageUtils;
import io.renren.utils.Query;
import io.renren.utils.R;
import io.renren.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.Map;

/**
 * 发布信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月26日 下午6:43:36
 */
@RestController
@RequestMapping("/xx/issue")
public class XxIssueController extends AbstractController {
	@Autowired
	private XxIssueService xxIssueService;
	
	/**
	 * 所有发布信息列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("xx:issue:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<XxIssueEntity> orgList = xxIssueService.queryList(query);
		int total = xxIssueService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(orgList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 配置医疗组织
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("xx:issue:info")
	public R info(@PathVariable("id") Integer id){
		XxIssueEntity issue = xxIssueService.queryObject(id);

		return R.ok().put("issue", issue);
	}

	/**
	 * 保存发布信息
	 */
	@SysLog("保存发布信息")
	@RequestMapping("/save")
	@RequiresPermissions("xx:issue:save")
	public R save(@RequestBody XxIssueEntity issue){
		ValidatorUtils.validateEntity(issue);

		xxIssueService.save(issue);
		
		return R.ok();
	}
	
	/**
	 * 修改发布信息
	 */
	@SysLog("修改发布信息")
	@RequestMapping("/update")
	@RequiresPermissions("xx:issue:update")
	public R update(@RequestBody XxIssueEntity issue){
		ValidatorUtils.validateEntity(issue);

		xxIssueService.update(issue);
		
		return R.ok();
	}
	
	/**
	 * 删除发布信息
	 */
	@SysLog("删除发布信息")
	@RequestMapping("/delete")
	@RequiresPermissions("xx:issue:delete")
	public R delete(@RequestBody Integer[] ids){
		//TODO 关联删除需要做
		xxIssueService.deleteBatch(ids);
		
		return R.ok();
	}

}
