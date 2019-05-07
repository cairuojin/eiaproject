package com.gjsyoung.eiaproject;

import com.gjsyoung.eiaproject.domain.ProjectInfo;
import com.gjsyoung.eiaproject.mapper.ProjectInfoMapper;
import com.gjsyoung.eiaproject.mapper.assist.ProjectInfoStatusMapper;
import com.gjsyoung.eiaproject.utils.RedisCache;
import com.gjsyoung.eiaproject.vo.ProjectListVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class EiaprojectApplicationTests {

    @Autowired
    RedisCache redisCache;


    @Test
    public void contextLoads() {
        redisCache.clear();
        String a
    }

}

