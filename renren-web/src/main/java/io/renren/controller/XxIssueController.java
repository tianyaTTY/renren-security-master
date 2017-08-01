package io.renren.controller;

import io.renren.annotation.SysLog;
import io.renren.entity.XxIssueEntity;
import io.renren.service.XxIssueService;
import io.renren.utils.DateUtils;
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
		List<XxIssueEntity> issueList = xxIssueService.queryList(query);
		for (XxIssueEntity issue:issueList) {
			if (issue.getCategory()==1){
				issue.setCategoryName("旅游景点");
			}
			if (issue.getCategory()==2){
				issue.setCategoryName("农牧业");
			}
		}
		int total = xxIssueService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(issueList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 配置发布信息
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
		String sysTime = DateUtils.getSysTime();
		issue.setCreateDate(sysTime);
		issue.setUpdateDate(sysTime);
		xxIssueService.save(issue );
		
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
		String sysTime = DateUtils.getSysTime();
		issue.setUpdateDate(sysTime);
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
		xxIssueService.deleteBatch(ids);
		
		return R.ok();
	}

}
