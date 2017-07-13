package io.renren.controller;

import io.renren.annotation.SysLog;
import io.renren.entity.YlDepartmentEntity;
import io.renren.entity.YlHospitalEntity;
import io.renren.entity.YlOrganizationEntity;
import io.renren.service.YlDepartmentService;
import io.renren.service.YlHospitalService;
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
 * 科室信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
@RestController
@RequestMapping("/yl/department")
public class YlDepartmentController extends AbstractController {
	@Autowired
	private YlDepartmentService ylDepartmentService;
	@Autowired
	private YlHospitalService ylHospitalService;
	@Autowired
	private YlOrganizationService ylOrganizationService;
	
	/**
	 * 所有科室信息列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("yl:department:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<YlDepartmentEntity> departmentList = ylDepartmentService.queryList(query);
		int total = ylDepartmentService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(departmentList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 配置医院信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("yl:department:info")
	public R info(@PathVariable("id") Integer id){
		YlDepartmentEntity department = ylDepartmentService.queryObject(id);
		YlHospitalEntity hospital = ylHospitalService.queryObject(department.getHospitalId());
		YlOrganizationEntity organization = ylOrganizationService.queryObject(hospital.getOrgId());
		return R.ok().put("hospital", hospital).put("hospital",hospital).put("organization",organization);
	}
	
	/**
	 * 保存科室信息
	 */
	@SysLog("保存科室信息")
	@RequestMapping("/save")
	@RequiresPermissions("yl:department:save")
	public R save(@RequestBody YlDepartmentEntity department){
		ValidatorUtils.validateEntity(department);

		ylDepartmentService.save(department);
		
		return R.ok();
	}
	
	/**
	 * 修改科室信息
	 */
	@SysLog("修改科室信息")
	@RequestMapping("/update")
	@RequiresPermissions("yl:department:update")
	public R update(@RequestBody YlDepartmentEntity department){
		ValidatorUtils.validateEntity(department);

		ylDepartmentService.update(department);
		
		return R.ok();
	}
	
	/**
	 * 删除科室信息
	 */
	@SysLog("删除科室信息")
	@RequestMapping("/delete")
	@RequiresPermissions("yl:department:delete")
	public R delete(@RequestBody Integer[] ids){
		//TODO 关联删除需要做
		ylDepartmentService.deleteBatch(ids);
		
		return R.ok();
	}

}
