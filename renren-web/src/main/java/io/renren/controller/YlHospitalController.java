package io.renren.controller;

import com.alibaba.fastjson.JSON;
import io.renren.annotation.SysLog;
import io.renren.entity.YlHospitalEntity;
import io.renren.entity.YlOrganizationEntity;
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
 * 医院信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
@RestController
@RequestMapping("/yl/hospital")
public class YlHospitalController extends AbstractController {
	@Autowired
	private YlHospitalService ylHospitalService;
	@Autowired
	private YlOrganizationService ylOrganizationService;
	
	/**
	 * 所有医院信息列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("yl:hospital:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<YlHospitalEntity> hospitalList = ylHospitalService.queryList(query);
		int total = ylHospitalService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(hospitalList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 配置医院信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("yl:hospital:info")
	public R info(@PathVariable("id") Integer id){
		YlHospitalEntity hospital = ylHospitalService.queryObject(id);
		YlOrganizationEntity organization = ylOrganizationService.queryObject(hospital.getOrgId());
		return R.ok().put("hospital", hospital).put("organization",organization);
	}
	
	/**
	 * 保存医院信息
	 */
	@SysLog("保存医疗组织")
	@RequestMapping("/save")
	@RequiresPermissions("yl:hospital:save")
	public R save(@RequestBody YlHospitalEntity hospital){
		ValidatorUtils.validateEntity(hospital);

		ylHospitalService.save(hospital);
		
		return R.ok();
	}

	/**
	 * 查询科室所属的机构树
	 */
	@RequestMapping("/select")
	@RequiresPermissions("yl:hospital:select")
	public R select(){
		//TODO 选择树节点提交的数据，修改跟进进来的节点
		//查询树结构
		List<YlOrganizationEntity> orgList = ylOrganizationService.queryList(null);
		List<YlHospitalEntity> hosList = ylHospitalService.queryList(null);
		List<YlTreeEntity> ylList = new ArrayList<YlTreeEntity>();
		int count=0;
		for(int i=0;i<orgList.size();i++){
			YlTreeEntity ylTreeEntity = new YlTreeEntity();
			ylTreeEntity.setId(orgList.get(i).getId());
			ylTreeEntity.setName(orgList.get(i).getName());
			ylTreeEntity.setOpen(true);
			ylTreeEntity.setParentId(0);
			ylTreeEntity.setNewId(count++);
			ylList.add(ylTreeEntity);
		}
		for(int j=0;j<hosList.size();j++){
			YlTreeEntity ylTreeEntity = new YlTreeEntity();
			ylTreeEntity.setId(hosList.get(j).getId()+1000);
			ylTreeEntity.setName(hosList.get(j).getName());
			ylTreeEntity.setOpen(true);
			ylTreeEntity.setParentId(hosList.get(j).getOrgId());
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
	 * 修改医院信息
	 */
	@SysLog("修改医疗组织")
	@RequestMapping("/update")
	@RequiresPermissions("yl:hospital:update")
	public R update(@RequestBody YlHospitalEntity hospital){
		ValidatorUtils.validateEntity(hospital);

		ylHospitalService.update(hospital);
		
		return R.ok();
	}
	
	/**
	 * 删除医院信息
	 */
	@SysLog("删除医疗组织")
	@RequestMapping("/delete")
	@RequiresPermissions("yl:hospital:delete")
	public R delete(@RequestBody Integer[] ids){
		//关联删除科室和专家信息
		ylHospitalService.deleteBatch(ids);
		
		return R.ok();
	}

}
