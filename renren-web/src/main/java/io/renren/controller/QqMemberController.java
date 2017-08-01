package io.renren.controller;

import io.renren.annotation.SysLog;
import io.renren.entity.QqMemberEntity;
import io.renren.entity.XxIssueEntity;
import io.renren.service.QqMemberService;
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
 * APP用户
 *
 * @author tangty
 * @email tianyaTTY@gmail.com
 * @date 2017年8月1日 下午6:43:36
 */
@RestController
@RequestMapping("/qq/member")
public class QqMemberController extends AbstractController {
	@Autowired
	private QqMemberService memberService;
	
	/**
	 * 所有APP用户列表
	 */
	@RequestMapping("/list")
	@RequiresPermissions("qq:member:list")
	public R list(@RequestParam Map<String, Object> params){
		//查询列表数据
		Query query = new Query(params);
		List<QqMemberEntity> memberList = memberService.queryList(query);
		int total = memberService.queryTotal(query);
		
		PageUtils pageUtil = new PageUtils(memberList, total, query.getLimit(), query.getPage());
		
		return R.ok().put("page", pageUtil);
	}

	/**
	 * 配置APP用户信息
	 */
	@RequestMapping("/info/{id}")
	@RequiresPermissions("qq:member:info")
	public R info(@PathVariable("id") Integer id){
		QqMemberEntity member = memberService.queryObject(id);

		return R.ok().put("member", member);
	}

	/**
	 * 保存APP用户信息
	 */
	@SysLog("保存发布信息")
	@RequestMapping("/save")
	@RequiresPermissions("qq:member:save")
	public R save(@RequestBody QqMemberEntity member){
		ValidatorUtils.validateEntity(member);
		String sysTime = DateUtils.getSysTime();
		member.setRegisterDate(sysTime);
		member.setUpdateDate(sysTime);
		memberService.save(member);
		return R.ok();
	}
	
	/**
	 * 修改APP用户信息
	 */
	@SysLog("修改APP用户信息")
	@RequestMapping("/update")
	@RequiresPermissions("qq:member:update")
	public R update(@RequestBody QqMemberEntity member){
		ValidatorUtils.validateEntity(member);
		String sysTime = DateUtils.getSysTime();
		member.setUpdateDate(sysTime);
		memberService.update(member);
		return R.ok();
	}
	
	/**
	 * 删除APP用户信息
	 */
	@SysLog("删除APP用户信息")
	@RequestMapping("/delete")
	@RequiresPermissions("qq:member:delete")
	public R delete(@RequestBody Integer[] ids){
		memberService.deleteBatch(ids);
		
		return R.ok();
	}

}
