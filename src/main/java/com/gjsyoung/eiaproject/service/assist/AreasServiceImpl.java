package com.gjsyoung.eiaproject.service.assist;

import com.gjsyoung.eiaproject.domain.assist.Areas;
import com.gjsyoung.eiaproject.domain.assist.Cities;
import com.gjsyoung.eiaproject.domain.assist.Provinces;
import com.gjsyoung.eiaproject.mapper.assist.AreasMapper;
import com.gjsyoung.eiaproject.mapper.assist.CitiesMapper;
import com.gjsyoung.eiaproject.mapper.assist.ProvincesMapper;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

/**
 * create by cairuojin on 2019/01/31
 */
@Service
public class AreasServiceImpl implements AreasService {


    @Autowired
    AreasMapper areasMapper;

    @Autowired
    CitiesMapper citiesMapper;

    @Autowired
    ProvincesMapper provincesMapper;

    private List<Provinces> provincesList = null;    //省列表

    private Map<String , List> citiesMap = new HashMap<>();    //市Map     省id , List市

    private Map<String , List> areasMap = new HashMap<>();      //区域Map  市id , List区

    private static final Logger logger = LoggerFactory.getLogger(AreasServiceImpl.class);

    /**
     * 加载省市区三级列表
     */
    @Override
    public void loadAreas() {
        long l1 = System.currentTimeMillis();
        logger.info("开始加载省市区");
        List<Areas> areas = areasMapper.selectAll();
        List<Cities> cities = citiesMapper.selectAll();
        this.provincesList = provincesMapper.selectAll();   //省列表

        List singleList = null;
        for(Cities citie : cities){         //加载城市列表
            singleList = this.citiesMap.get(citie.getProvinceid());
            if(singleList == null){
                singleList = new LinkedList();
                this.citiesMap.put(citie.getProvinceid(),singleList);
            }
            singleList.add(citie);
        }
        singleList.clear();
        for (Areas area : areas){         //加载区域列表
            singleList = this.areasMap.get(area.getCityid());
            if(singleList == null){
                singleList = new LinkedList();
                this.areasMap.put(area.getCityid(),singleList);
            }
            singleList.add(area);
        }
        logger.info("加载省市区完毕  ms : " + (System.currentTimeMillis() - l1));
    }


    @Override
    public List<Provinces> getProvinces() {
        return this.provincesList;
    }

    @Override
    public List<Cities> getCites(String provinceid) {
        return this.citiesMap.get(provinceid);
    }

    @Override
    public List<Areas> getAreas(String cityid) {
        return this.areasMap.get(cityid);
    }
}
