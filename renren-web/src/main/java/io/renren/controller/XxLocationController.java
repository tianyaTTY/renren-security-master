package io.renren.controller;

import io.renren.annotation.SysLog;
import io.renren.entity.XxLocationEntity;
import io.renren.service.XxLocationService;
import io.renren.utils.*;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;
import java.util.Map;


/**
 * 位置信息
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年7月11日 下午6:43:36
 */
@RestController
@RequestMapping("/xx/location")
public class XxLocationController {
	@Autowired
	private XxLocationService xxLocationService;
	
	/**
	 * 列表
	 */
	@ResponseBody
	@RequestMapping("/list")
	@RequiresPermissions("xx:location:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<XxLocationEntity> locationList = xxLocationService.queryList(query);
		int total = xxLocationService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(locationList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 查询列表
	 */
	@RequestMapping("/select")
	@RequiresPermissions("xx:location:select")
	public List select(@RequestParam Map<String, Object> params){
		//查询位置列表列表
		List<XxLocationEntity> locationList = xxLocationService.queryList(params);
		return locationList;
	}

	/**
	 * 保存位置信息
	 */
	@SysLog("新增位置信息")
	@RequestMapping("/save")
	@RequiresPermissions("xx:location:save")
	public R save(@RequestParam Map<String, Object> params){
		try{
			//初始化location对象
			XxLocationEntity location = new XxLocationEntity();
			location.setName(StringUtils.parseString(params.get("name")));
			location.setAddress(StringUtils.parseString(params.get("address")));
			location.setContact(StringUtils.parseString(params.get("contact")));
			location.setPhone(StringUtils.parseString(params.get("phone")));
			location.setCategory(StringUtils.parseInteger(params.get("category")));
			location.setLatitude(StringUtils.parseString(params.get("latitude")));
			location.setLongitude(StringUtils.parseString(params.get("longitude")));
			location.setCreateDate(DateUtils.getSysTime());
			location.setUpdateDate(DateUtils.getSysTime());
			xxLocationService.save(location);
		}catch (Exception e){
			R.error();
		}
		return R.ok();
	}

	/**
	 * 修改位置信息
	 */
	@SysLog("修改位置信息")
	@RequestMapping("/update")
	@RequiresPermissions("xx:location:update")
	public R update(@RequestParam Map<String, Object> params){
		try {
			//初始化location对象
			XxLocationEntity location = new XxLocationEntity();
			location.setId(StringUtils.parseInteger(params.get("id")));
			location.setName(StringUtils.parseString(params.get("name")));
			location.setAddress(StringUtils.parseString(params.get("address")));
			location.setContact(StringUtils.parseString(params.get("contact")));
			location.setPhone(StringUtils.parseString(params.get("phone")));
			location.setCategory(StringUtils.parseInteger(params.get("category")));
			location.setLatitude(StringUtils.parseString(params.get("latitude")));
			location.setLongitude(StringUtils.parseString(params.get("longitude")));
			location.setUpdateDate(DateUtils.getSysTime());
			xxLocationService.update(location);
		}catch (Exception e){
			R.error();
		}
		return R.ok();
	}

	/**
	 * 删除位置信息
	 */
	@SysLog("删除位置信息")
	@RequestMapping("/delete")
	@RequiresPermissions("xx:location:delete")
	public R delete(@RequestParam Map<String, Object> params){
		try {
			Integer id = StringUtils.parseInteger(params.get("id"));
			Integer[] ids = new Integer[]{id};
			xxLocationService.deleteBatch(ids);
		}catch (Exception e){
			R.error();
		}
		return R.ok();
	}
}
