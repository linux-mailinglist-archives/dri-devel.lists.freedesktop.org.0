Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D365F478E2
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jun 2019 06:01:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9FEB89159;
	Mon, 17 Jun 2019 04:01:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id C02CF89159
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jun 2019 04:01:05 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id BCF4272167; Mon, 17 Jun 2019 04:01:05 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110926] on Centos 6.10
Date: Mon, 17 Jun 2019 04:01:05 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: wilhelm.horrix@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-110926-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1634822469=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1634822469==
Content-Type: multipart/alternative; boundary="15607440651.E9dDb1D8F.23099"
Content-Transfer-Encoding: 7bit


--15607440651.E9dDb1D8F.23099
Date: Mon, 17 Jun 2019 04:01:05 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110926

            Bug ID: 110926
           Summary: on Centos 6.10
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: wilhelm.horrix@gmail.com

Created attachment 144566
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144566&action=3Dedit
X- server won't start

1.) The pre-install script looks for '/boot/SystemMap-'
2.) Xorg.0.log excerpt=20
[    27.790] (II) LoadModule: "amdgpu"
[    27.790] (II) Loading /opt/amdgpu/lib64/xorg/modules/drivers/amdgpu_drv=
.so
[    27.790] (II) Module amdgpu: vendor=3D"X.Org Foundation"
[    27.790]    compiled for 1.17.4, module version =3D 18.1.99
[    27.790]    Module class: X.Org Video Driver
[    27.790]    ABI class: X.Org Video Driver, version 19.0
[    27.790] (II) AMDGPU: Driver for AMD Radeon:
        All GPUs supported by the amdgpu kernel driver
[    27.790] (++) using VT number 1

[    27.792] (II) AMDGPU(0): [KMS] drm report modesetting isn't supported.
[    27.792] (EE) Screen 0 deleted because of no matching config section.
[    27.792] (II) UnloadModule: "amdgpu"
[    27.792] (EE) Device(s) detected, but none match those in the config fi=
le.
[    27.792] (EE)=20
Fatal server error:
[    27.792] (EE) no screens found(EE)=20
[    27.792] (EE)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15607440651.E9dDb1D8F.23099
Date: Mon, 17 Jun 2019 04:01:05 +0000
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
   title=3D"NEW - on Centos 6.10"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110926">110926</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>on Centos 6.10
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
          <td>DRM/AMDgpu-pro
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>wilhelm.horrix&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144566=
" name=3D"attach_144566" title=3D"X- server won't start">attachment 144566<=
/a> <a href=3D"attachment.cgi?id=3D144566&amp;action=3Dedit" title=3D"X- se=
rver won't start">[details]</a></span>
X- server won't start

1.) The pre-install script looks for '/boot/SystemMap-'
2.) Xorg.0.log excerpt=20
[    27.790] (II) LoadModule: &quot;amdgpu&quot;
[    27.790] (II) Loading /opt/amdgpu/lib64/xorg/modules/drivers/amdgpu_drv=
.so
[    27.790] (II) Module amdgpu: vendor=3D&quot;X.Org Foundation&quot;
[    27.790]    compiled for 1.17.4, module version =3D 18.1.99
[    27.790]    Module class: X.Org Video Driver
[    27.790]    ABI class: X.Org Video Driver, version 19.0
[    27.790] (II) AMDGPU: Driver for AMD Radeon:
        All GPUs supported by the amdgpu kernel driver
[    27.790] (++) using VT number 1

[    27.792] (II) AMDGPU(0): [KMS] drm report modesetting isn't supported.
[    27.792] (EE) Screen 0 deleted because of no matching config section.
[    27.792] (II) UnloadModule: &quot;amdgpu&quot;
[    27.792] (EE) Device(s) detected, but none match those in the config fi=
le.
[    27.792] (EE)=20
Fatal server error:
[    27.792] (EE) no screens found(EE)=20
[    27.792] (EE)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15607440651.E9dDb1D8F.23099--

--===============1634822469==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1634822469==--
