/*
 * Created on Feb 1, 2005
 *
 *
 */
package com.taubman.web.formext.session;

import com.documentum.fc.common.DfException;
import com.documentum.fc.common.DfLogger;
import com.documentum.web.common.ArgumentList;

import com.documentum.web.formext.session.AuthenticationService;
import com.documentum.web.formext.session.IAuthenticationScheme;
import com.documentum.web.formext.session.IAuthenticationService;
import java.io.IOException;
import java.io.InputStream;
import java.util.Enumeration;
import java.util.PropertyResourceBundle;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;



/**
 * A class that implements the auto login authentication scheme.
 *
 * @author Tim Fassett (tim.fassett@brtsi.com)
 */
public class AutoLoginAuthenticationScheme implements IAuthenticationScheme {
    
    /**
     * Properties filename that contains the defined credentials.
     */
    private static String RES_BUNDLE_NAME = "AutoLoginAuthentication.properties";
    
    /**
     * Resource bundle that loads up the credentials.
     */
    private static PropertyResourceBundle s_resBundle = null;
    
    /**
     *
     *
     * Implements the silent authentication mechanism(scheme). It reads credentials from the
     * SilentAuthentication.properties file and creates sessions for all the credentials.
     *
     * <p>
     * This method is an implementation of IAuthenticationScheme#authenticate(...)
     * @see com.documentum.web.formext.session.IAuthenticationScheme#authenticate(javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse, java.lang.String)
     *
     * @param request The HTTP request request. If the request contains a
     * <br>           flag to use explicit login, silent authentication is ignored.
     * @param response The HTTP response. Not used in this method.
     * @param docbase Docbase name. Ignored in this implementation.
     *
     * @return docbase The docbase into which the user was logged in.
     */
    public String authenticate(
    HttpServletRequest request,
    HttpServletResponse response,
    String docbase)
    throws DfException {
        
        HttpSession sess = request.getSession();
        String docbaseName = null;
        String userName = null;
        String password = null;
        try {
            
            IAuthenticationService service = AuthenticationService.getService();
            initCredentials();
            
            Enumeration docbases = s_resBundle.getKeys();
            userName = getUserName(request);
            password = getPassword(request);
            docbaseName = s_resBundle.getString("docbasename");
            
            DfLogger.debug(this,"Got docbase: " + docbaseName,null,null);
            service.login(sess, docbaseName, userName, password, null);
        } catch (Exception e) {
            docbaseName = null;
            e.printStackTrace();
            DfLogger.debug(this,"custom authentication scheme failed dropping to next scheme: ",null,null);
        }
        return docbaseName;
    }
    
    /**
     * This method is an implementation of  IAuthenticationScheme#getLoginComponent(...).
     *
     * This method is not implemented because the silent authentication scheme does not have
     * its own login component.
     *
     * @return Always <code>null</code>
     */
    public String getLoginComponent(
    HttpServletRequest request,
    HttpServletResponse response,
    String docbase,
    ArgumentList outArgs) {
        return null;
    }
    
    /**
     *
     * This method returns the user name from the request object (i.e. the userId parameter on the URL)
     *
     * @return userName 
     */
    public String getUserName(
    HttpServletRequest request
    ) {
        String userName = request.getParameter("dat1");
        return userName;
    }
    
    /**
     *
     * This method returns the password from the request object (i.e. the userId parameter on the URL)
     * @return password
     */
    public String getPassword(
    HttpServletRequest request
    ) {
        
        String password = request.getParameter("dat2");
        return password;
    }
    
    /**
     * Loads the properties file that contains credentials
     *
     */
    protected void initCredentials() {
        try {
            if (s_resBundle == null) {
                InputStream is =
                AutoLoginAuthenticationScheme.class.getResourceAsStream(
                RES_BUNDLE_NAME);
                s_resBundle = new PropertyResourceBundle(is);
                DfLogger.debug(this,"Got resource bundle: " + s_resBundle,null,null);
            }
        }
        catch (IOException ioe) {
            DfLogger.error(this,"Error loading silent authentication properties.",null,ioe);
        }
    }
    
}
