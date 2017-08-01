package io.renren.controller;

import io.renren.annotation.SysLog;
import io.renren.entity.QqLoginRecordEntity;
import io.renren.entity.QqMemberEntity;
import io.renren.service.QqLoginRecordService;
import io.renren.service.QqMemberService;
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
 * APP用户登录记录
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年8月1日 下午6:43:36
 */
@RestController
@RequestMapping("/qq/loginRecord")
public class QqLoginRecordController extends AbstractController {
	@Autowired
	private QqLoginRecordService recordService;
	
	/**
	 * 所有APP用户列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("qq:loginRecord:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<QqLoginRecordEntity> recordList = recordService.queryList(query);
		int total = recordService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(recordList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 配置APP用户信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("qq:loginRecord:info")
	public R info(@PathVariable("id") Integer id){
		QqLoginRecordEntity record = recordService.queryObject(id);

		return R.ok().put("record", record);
	}

	/**
	 * 保存APP用户信息
	 */
	@SysLog("保存发布信息")
	@RequestMapping("/save")
	@RequiresPermissions("qq:loginRecord:save")
	public R save(@RequestBody QqLoginRecordEntity record){
		ValidatorUtils.validateEntity(record);
		recordService.save(record);
		return R.ok();
	}
	
	/**
	 * 修改APP用户信息
	 */
	@SysLog("修改APP用户信息")
	@RequestMapping("/update")
	@RequiresPermissions("qq:loginRecord:update")
	public R update(@RequestBody QqLoginRecordEntity record){
		ValidatorUtils.validateEntity(record);
		recordService.update(record);
		return R.ok();
	}
	
	/**
	 * 删除APP用户信息
	 */
	@SysLog("删除APP用户信息")
	@RequestMapping("/delete")
	@RequiresPermissions("qq:loginRecord:delete")
	public R delete(@RequestBody Integer[] ids){
		recordService.deleteBatch(ids);
		return R.ok();
	}

}
