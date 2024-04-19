
https://www.udemy.com/course/api-testing-for-beginners-using-postman/learn/lecture/19820900?start=210#overview
Use Safari
Login with Google
================================================================
Installed Redmine (Logged in with Google)
================================================================
From the Redmine Terminal:
# cat /home/bitnami/bitnami_credentials 
The default username and password is 'user' and 'enh72zsAZSJf'.

# curl -k https://localhost/projects.json

Behind the Redmine Terminal:
/usr/bin/clear; ssh -i '/Users/dwyttenb/.bitnami/stackman/machines/redmine/ssh/id_rsa' -o StrictHostKeyChecking=no 'root@192.168.64.2'
================================================================
From the Mac Terminal:
$ diff before-bitnami.txt after-bitnami.txt 
0a1,4
> tcp6       0      0  *.53                   *.*                    LISTEN     
> tcp4       0      0  *.53                   *.*                    LISTEN     
> tcp4       0      0  127.0.0.1.8021         *.*                    LISTEN     
> tcp6       0      0  ::1.8021               *.*                    LISTEN     
Note that the Mac itself is not listening on port 80, only the Linux VM is.
================================================================
From Postman:
http://192.168.64.2/projects.json
http://192.168.64.2/users.json <- requires Basic Auth
================================================================
Thu Jun  2 10:26:26 CDT 2022
On Mac:
1. Launch Redmine
 a. Start
 b. Open Terminal
2. Launch Postman
 a. Login with Google (Assigned user name is research-astronomer-18113449)
 b. My Workspace
  i. users.json
Ugh! 500 error
Restart Apache? Twice?!
Double Ugh! 
https://www.redmine.org/boards/2/topics/29317?r=29334
================================================================
Thu Jun  2 10:58:27 CDT 2022
POST
Content-Type: application/json
Raw Body:
{
    "project":
    {
        "name": "Free the Foo Fighters",
        "identifier": "foo"
    }
}
================================================================
11:20:00$ curl http://192.168.64.2/projects.json | jq
  % Total    % Received % Xferd  Average Speed   Time    Time     Time  Current
                                 Dload  Upload   Total   Spent    Left  Speed
100   464  100   464    0     0   8571      0 --:--:-- --:--:-- --:--:-- 11047
{
  "projects": [
    {
      "id": 2,
      "name": "Free the Foo Fighters",
      "identifier": "foo",
      "description": "Some silliness",
      "status": 1,
      "is_public": true,
      "inherit_members": false,
      "created_on": "2022-06-02T15:57:20Z",
      "updated_on": "2022-06-02T16:12:54Z"
    },
    {
      "id": 1,
      "name": "RestRedmine",
      "identifier": "restredmine",
      "description": "",
      "status": 1,
      "is_public": true,
      "inherit_members": false,
      "created_on": "2022-05-18T20:30:35Z",
      "updated_on": "2022-05-18T20:30:35Z"
    }
  ],
  "total_count": 2,
  "offset": 0,
  "limit": 25
}
~/projects/postman
11:20:06$
================================================================