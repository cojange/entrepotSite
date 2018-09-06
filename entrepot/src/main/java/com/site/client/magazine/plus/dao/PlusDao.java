package com.site.client.magazine.plus.dao;

import java.util.List;


import com.site.client.magazine.plus.vo.PlusVO;

public interface PlusDao {

	public List<PlusVO> plusList(String pd_num);

	public int pluschoice(PlusVO av);

	public int pluschoice2(PlusVO av);

}
