package io.renren.controller;

import io.renren.annotation.SysLog;
import io.renren.entity.YlOrganizationEntity;
import io.renren.service.YlOrganizationService;
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
 * 医疗组织信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
@RestController
@RequestMapping("/yl/organization")
public class YlOrganizationController extends AbstractController {
	@Autowired
	private YlOrganizationService ylOrganizationService;
	
	/**
	 * 所有医疗组织列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("yl:organization:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<YlOrganizationEntity> orgList = ylOrganizationService.queryList(query);
		int total = ylOrganizationService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(orgList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 配置医疗组织
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("yl:organization:info")
	public R info(@PathVariable("id") Integer id){
		YlOrganizationEntity org = ylOrganizationService.queryObject(id);

		return R.ok().put("organization", org);
	}

	/**
	 * 选择医疗组织
	 */
	@RequestMapping("/select")
	@RequiresPermissions("yl:organization:select")
	public R select(){
		//查询列表数据
		List<YlOrganizationEntity> orgList = ylOrganizationService.queryList(null);

		//添加顶级菜单
		YlOrganizationEntity root = new YlOrganizationEntity();
		root.setMenuId(0L);
		root.setName("一级菜单");
		root.setParentId(-1L);
		root.setOpen(true);
		menuList.add(root);

		return R.ok().put("orgList", orgList);
	}

	/**
	 * 保存医疗组织
	 */
	@SysLog("保存医疗组织")
	@RequestMapping("/save")
	@RequiresPermissions("yl:organization:save")
	public R save(@RequestBody YlOrganizationEntity org){
		ValidatorUtils.validateEntity(org);

		ylOrganizationService.save(org);
		
		return R.ok();
	}
	
	/**
	 * 修改医疗组织
	 */
	@SysLog("修改医疗组织")
	@RequestMapping("/update")
	@RequiresPermissions("yl:organization:update")
	public R update(@RequestBody YlOrganizationEntity org){
		ValidatorUtils.validateEntity(org);

		ylOrganizationService.update(org);
		
		return R.ok();
	}
	
	/**
	 * 删除医疗组织
	 */
	@SysLog("删除医疗组织")
	@RequestMapping("/delete")
	@RequiresPermissions("yl:organization:delete")
	public R delete(@RequestBody Integer[] ids){
		ylOrganizationService.deleteBatch(ids);
		
		return R.ok();
	}

}
