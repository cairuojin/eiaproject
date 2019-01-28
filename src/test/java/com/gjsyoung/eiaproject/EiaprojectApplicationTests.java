package com.gjsyoung.eiaproject;

import com.gjsyoung.eiaproject.domain.User;
import com.gjsyoung.eiaproject.mapper.UserMapper;
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
	RedisCache redisCache;

	@Autowired
	UserMapper userMapper;

	@Test
	public void contextLoads() {
		for(int i = 0; i < 40; i++){
			User user = new User();
			user.setUsername("ABC" + i);
			user.setRole(i%10);
			user.setName("CCC"+i);
			user.setSex(0);
			user.setDepartment(i % 12);
			userMapper.insert(user);
		}
	}

}

