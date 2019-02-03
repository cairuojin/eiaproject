package com.gjsyoung.eiaproject;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
import com.gjsyoung.eiaproject.service.assist.ProjectInfoAssistService;
import com.gjsyoung.eiaproject.utils.RedisCache;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

@RunWith(SpringRunner.class)
@SpringBootTest
public class EiaprojectApplicationTests {

	@Autowired
	ProjectInfoAssistService projectInfoAssistService;

	@Autowired
	RedisCache redisCache;

	@Test
	public void contextLoads() {
//		projectInfoAssistService.getScope(3);
		redisCache.clear();
	}

}

