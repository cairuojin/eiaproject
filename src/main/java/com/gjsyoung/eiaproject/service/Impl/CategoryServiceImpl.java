package com.gjsyoung.eiaproject.service.Impl;

import com.gjsyoung.eiaproject.domain.Category;
import com.gjsyoung.eiaproject.domain.Role;
import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.CategoryMapper;
import com.gjsyoung.eiaproject.service.CategoryService;
import com.gjsyoung.eiaproject.service.RoleService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.*;

/**
 * create by cairuojin on 2019/01/23
 * 获得导航
 */
@Service
public class CategoryServiceImpl implements CategoryService {

    private Map roleCategory = null; //身份导航内容

    public static final String role = "ROLE_";

    public static final String parent = "_PARENT_";

    private static final Logger logger = LoggerFactory.getLogger(CategoryServiceImpl.class);

    @Autowired
    CategoryMapper categoryMapper;

    @Autowired
    RoleService roleService;


    /**
     * 加载导航  封装结果到Map中
     */
    @Override
    public void loadCategory() {
        long l1 = System.currentTimeMillis();
        logger.info("开始加载导航");

        List<Category> categoryList = categoryMapper.selectAllByStatus(0);  //查询启用的全部导航

        Map<String, Object> roleMap = new HashMap<>();  //封装<身份，对应的List<Category>>
        List roleCategory;  //临时变量  导航List

        //根据该category所属的身份，放到身份对应的list中
        for(Category category : categoryList){
            String[] split = category.getRole().split("、");     //划分身份，依据每一个身份添加到相应的List中
            for(String s : split){
                Object o = roleMap.get(role + s);  //从Map中获取到该role对应的List
                if(o == null){
                    roleCategory = new ArrayList();
                    roleCategory.add(category);
                    roleMap.put(role + s , roleCategory);
                } else {
                    roleCategory = (ArrayList)o;
                    roleCategory.add(category);
                }
            }
        }

        List roleAll = (List) roleMap.get(role + "ALL");    //将ALL权限List加上
        roleMap.remove(role + "ALL");
        List<Category> singleList = null;
        for (Map.Entry entry : roleMap.entrySet()){
            singleList = (List) entry.getValue();
            singleList.addAll(roleAll);
            Collections.sort(singleList);   //复写了排序方法，根据层级，排序号排列
        }

        //区分身份完毕，进行横导航分页
        Map<String , List> finalCategory = new HashMap();
        Map<String , List> tempMap = new HashMap();    //储存key ， father List
        List newSingleList = null;
        for(Map.Entry entry : roleMap.entrySet()){
            singleList = (List) entry.getValue();   //身份list
            for(Category category : singleList){
                if(category.getIsParent() == 0){
                    newSingleList = new ArrayList();
                    newSingleList.add(category);
                    finalCategory.put(category.getId() + "" + entry.getKey(), newSingleList);
                } else {
                    newSingleList = tempMap.get(category.getParentId() + "" + entry.getKey());  //找到有无爸爸
                    if(newSingleList != null){  //底层找到爸爸
                        newSingleList.add(category);
                    } else {
                        newSingleList = new ArrayList();
                        newSingleList.add(category);
                    }
                }
                tempMap.put(category.getId() + "" + entry.getKey(),newSingleList);
            }
        }

        //todo 递归删除无儿子的父节点 现在前端删除

        logger.info("加载导航完毕  ms : " + (System.currentTimeMillis() - l1));
        this.roleCategory = finalCategory;
    }


    /**
     * 根据角色英语名获得相应导航
     * @param headerPage   头部是第几个
     * @param engRoleName  身份英语名
     * @return
     */
    @Override
    public List<Category> getCategoryByRoleEngName(String headerPage , String engRoleName) {
        return (List<Category>) roleCategory.get(headerPage + role + engRoleName);
    }

    /**
     * 根据用户获得导航
     * @param headerPage 横向导航页码
     * @param user
     * @return
     */
    @Override
    public List<Category> getCategoryByUser(String headerPage , User user) {
        Integer roleId = user.getRole();
        Role role = roleService.selectByRoleID(roleId);
        return this.getCategoryByRoleEngName(headerPage , role.getEngname());
    }
}
