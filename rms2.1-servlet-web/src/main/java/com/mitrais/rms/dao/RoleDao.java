package com.mitrais.rms.dao;

import com.mitrais.rms.entity.Role;

public interface RoleDao {

	public Role findRoleByName(String theRoleName);
	
}
