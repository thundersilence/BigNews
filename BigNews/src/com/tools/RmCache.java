package com.tools;

import javax.servlet.http.HttpServletResponse;

/*
 * 除去网页缓存，仅开发用
 */

public class RmCache {
	public static void rm(HttpServletResponse resp) {
		resp.setDateHeader("Expires", -1);
		resp.setHeader("Cache-Control", "no-cache");
		resp.setHeader("Pragma", "no-cache");
	}
}
