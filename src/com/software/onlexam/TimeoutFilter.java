package com.software.onlexam;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class TimeoutFilter
 */
public class TimeoutFilter implements Filter {

	
	int iflag=1;
	static int iflag1=0;
	
	
	public static int getIflag1() {
		return iflag1;
	}

	public static void setIflag1(int iflag1) {
		TimeoutFilter.iflag1 = iflag1;
	}

	public int getIflag() {
		return iflag;
	}

	public void setIflag(int iflag) {
		this.iflag = iflag;
	}

	/**
     * Default constructor. 
     */
    public TimeoutFilter() {
        // TODO Auto-generated constructor stub
    	
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here

		System.out.println("filter called");
        final HttpServletRequest req = (HttpServletRequest) request;
        final HttpSession session = req.getSession(false);
        if(getIflag1()==1)
        {
        	iflag=1;
        }
        
        if (session != null && !session.isNew()) {
            chain.doFilter(request, response);
            iflag=0;
        } 
        else if(session==null && iflag==1)
        {
        	chain.doFilter(request, response);
        	iflag=1;
        }
        else if(iflag!=1 && session==null){
            System.out.println("Session Has timed out");
            req.getRequestDispatcher("SessExpired.jsp").forward(request, response);
        }
        
        
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
		iflag=1;
	}

}
