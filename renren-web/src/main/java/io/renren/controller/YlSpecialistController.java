package io.renren.controller;

import io.renren.annotation.SysLog;
import io.renren.entity.YlDepartmentEntity;
import io.renren.entity.YlHospitalEntity;
import io.renren.entity.YlOrganizationEntity;
import io.renren.entity.YlSpecialistEntity;
import io.renren.service.YlDepartmentService;
import io.renren.service.YlHospitalService;
import io.renren.service.YlOrganizationService;
import io.renren.service.YlSpecialistService;
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
 * 专家信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
@RestController
@RequestMapping("/yl/specialist")
public class YlSpecialistController extends AbstractController {
	@Autowired
	private YlSpecialistService ylSpecialistService;
	@Autowired
	private YlDepartmentService ylDepartmentService;
	@Autowired
	private YlHospitalService ylHospitalService;
	@Autowired
	private YlOrganizationService ylOrganizationService;
	
	/**
	 * 所有专家信息列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("yl:specialist:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<YlSpecialistEntity> specialistList = ylSpecialistService.queryList(query);
		int total = ylSpecialistService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(specialistList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 配置专家信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("yl:specialist:info")
	public R info(@PathVariable("id") Integer id){
		YlSpecialistEntity specialist = ylSpecialistService.queryObject(id);
		YlDepartmentEntity department = ylDepartmentService.queryObject(specialist.getDepartment());
		YlHospitalEntity hospital = ylHospitalService.queryObject(department.getHospitalId());
		YlOrganizationEntity organization = ylOrganizationService.queryObject(hospital.getOrgId());
		return R.ok().put("specialist",specialist).put("department", department).put("hospital",hospital).put("organization",organization);
	}
	
	/**
	 * 保存专家信息
	 */
	@SysLog("保存专家信息")
	@RequestMapping("/save")
	@RequiresPermissions("yl:specialist:save")
	public R save(@RequestBody YlSpecialistEntity specialist){
		ValidatorUtils.validateEntity(specialist);

		ylSpecialistService.save(specialist);
		
		return R.ok();
	}
	
	/**
	 * 修改专家信息
	 */
	@SysLog("修改专家信息")
	@RequestMapping("/update")
	@RequiresPermissions("yl:specialist:update")
	public R update(@RequestBody YlSpecialistEntity specialist){
		ValidatorUtils.validateEntity(specialist);

		ylSpecialistService.update(specialist);
		
		return R.ok();
	}
	
	/**
	 * 删除专家信息
	 */
	@SysLog("删除科室信息")
	@RequestMapping("/delete")
	@RequiresPermissions("yl:specialist:delete")
	public R delete(@RequestBody Integer[] ids){
		//TODO 关联删除需要做
		ylSpecialistService.deleteBatch(ids);
		
		return R.ok();
	}

}
