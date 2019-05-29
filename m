Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E912E792
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2019 23:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D359A6E12E;
	Wed, 29 May 2019 21:44:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id A510C6E12E
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2019 21:44:56 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 9FC4572167; Wed, 29 May 2019 21:44:56 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110795] Unable to install on latest Ubuntu (19.04)
Date: Wed, 29 May 2019 21:44:56 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: rolf@lagrangepoint.io
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110795-502@http.bugs.freedesktop.org/>
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============0805089480=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0805089480==
Content-Type: multipart/alternative; boundary="15591662961.3D74C4.25149"
Content-Transfer-Encoding: 7bit


--15591662961.3D74C4.25149
Date: Wed, 29 May 2019 21:44:56 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110795

            Bug ID: 110795
           Summary: Unable to install on latest Ubuntu (19.04)
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: rolf@lagrangepoint.io

The driver install is hard coded to reject anything other than 18.04, which=
 is
two versions behind current Ubuntu. Please update the driver.=20

```
Preparing to unpack .../amdgpu-core_19.10-785425_all.deb ...
ERROR: This package can only be installed on Ubuntu 18.04.
dpkg: error processing archive
/var/opt/amdgpu-pro-local/./amdgpu-core_19.10-785425_all.deb (--unpack):
 new amdgpu-core package pre-installation script subprocess returned error =
exit
status 1
Errors were encountered while processing:
 /var/opt/amdgpu-pro-local/./amdgpu-core_19.10-785425_all.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15591662961.3D74C4.25149
Date: Wed, 29 May 2019 21:44:56 +0000
MIME-Version: 1.0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

<html>
    <head>
      <base href=3D"https://bugs.freedesktop.org/">
    </head>
    <body><table border=3D"1" cellspacing=3D"0" cellpadding=3D"8">
        <tr>
          <th>Bug ID</th>
          <td><a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Unable to install on latest Ubuntu (19.04)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110795">110795</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Unable to install on latest Ubuntu (19.04)
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>XOrg git
          </td>
        </tr>

        <tr>
          <th>Hardware</th>
          <td>x86-64 (AMD64)
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>Linux (All)
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>blocker
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>medium
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/AMDgpu
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>rolf&#64;lagrangepoint.io
          </td>
        </tr></table>
      <p>
        <div>
        <pre>The driver install is hard coded to reject anything other than=
 18.04, which is
two versions behind current Ubuntu. Please update the driver.=20

```
Preparing to unpack .../amdgpu-core_19.10-785425_all.deb ...
ERROR: This package can only be installed on Ubuntu 18.04.
dpkg: error processing archive
/var/opt/amdgpu-pro-local/./amdgpu-core_19.10-785425_all.deb (--unpack):
 new amdgpu-core package pre-installation script subprocess returned error =
exit
status 1
Errors were encountered while processing:
 /var/opt/amdgpu-pro-local/./amdgpu-core_19.10-785425_all.deb
E: Sub-process /usr/bin/dpkg returned an error code (1)
```</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15591662961.3D74C4.25149--

--===============0805089480==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0805089480==--
