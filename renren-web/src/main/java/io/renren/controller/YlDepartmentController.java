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
import io.renren.vo.YlTreeEntity;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
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
	 * 配置科室信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("yl:department:info")
	public R info(@PathVariable("id") Integer id){
		YlDepartmentEntity department = ylDepartmentService.queryObject(id);
		YlHospitalEntity hospital = ylHospitalService.queryObject(department.getHospitalId());
		YlOrganizationEntity organization = ylOrganizationService.queryObject(hospital.getOrgId());
		return R.ok().put("department", department).put("hospital",hospital).put("organization",organization);
	}

	/**
	 * 查询专家所属的机构树
	 */
	@RequestMapping("/select")
	@RequiresPermissions("yl:department:select")
	public R select(){
		//TODO 选择树节点提交的数据，修改跟进进来的节点
		//查询树结构
		List<YlOrganizationEntity> orgList = ylOrganizationService.queryList(null);
		List<YlHospitalEntity> hosList = ylHospitalService.queryList(null);
		List<YlDepartmentEntity> depList = ylDepartmentService.queryList(null);
		List<YlTreeEntity> ylList = new ArrayList<YlTreeEntity>();
		for(int i=0;i<orgList.size();i++){
			YlTreeEntity ylTreeEntity = new YlTreeEntity();
			ylTreeEntity.setId(orgList.get(i).getId());
			ylTreeEntity.setName(orgList.get(i).getName());
			ylTreeEntity.setParentId(0);
			ylTreeEntity.setOpen(true);
			ylList.add(ylTreeEntity);
		}
		for(int j=0;j<hosList.size();j++){
			YlTreeEntity ylTreeEntity = new YlTreeEntity();
			ylTreeEntity.setId(hosList.get(j).getId()+1000);
			ylTreeEntity.setName(hosList.get(j).getName());
			ylTreeEntity.setParentId(hosList.get(j).getOrgId());
			ylTreeEntity.setOpen(true);
			ylList.add(ylTreeEntity);
		}
		for(int k=0;k<depList.size();k++){
			YlTreeEntity ylTreeEntity = new YlTreeEntity();
			ylTreeEntity.setId(depList.get(k).getId()+2000);
			ylTreeEntity.setName(depList.get(k).getName());
			ylTreeEntity.setParentId(depList.get(k).getHospitalId()+1000);
			ylTreeEntity.setOpen(true);
			ylList.add(ylTreeEntity);
		}
		//添加顶级菜单
		YlTreeEntity root = new YlTreeEntity();
		root.setId(0);
		root.setName("医疗信息");
		root.setParentId(-1);
		root.setOpen(true);
		ylList.add(root);

		return R.ok().put("ylList", ylList);
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
