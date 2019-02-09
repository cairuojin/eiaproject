package com.gjsyoung.eiaproject.service.assist;

import com.gjsyoung.eiaproject.domain.assist.Areas;
import com.gjsyoung.eiaproject.domain.assist.Cities;
import com.gjsyoung.eiaproject.domain.assist.Provinces;

import java.util.List;

/**
 * create by cairuojin on 2019/01/31
 */
public interface AreasService {

    public void loadAreas();


    public List<Provinces> getProvinces();

    public List<Cities> getCites(String provinceid);

    public List<Areas> getAreas(String cityid);

    public Provinces getProvince(String provinceid);

    public Cities getCity(String cityid);

    public Areas getArea(String areaid);
}
