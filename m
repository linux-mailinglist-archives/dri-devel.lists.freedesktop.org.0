Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC65E67C47
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jul 2019 00:47:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA2F89ADC;
	Sat, 13 Jul 2019 22:47:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id EC7B689ADC
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Jul 2019 22:47:08 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DED1272167; Sat, 13 Jul 2019 22:47:08 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: =?UTF-8?B?W0J1ZyAxMTExMjRdIFtkcm06YW1kZ3B1X2RtX2F0b21pY19jb21taXRfdGFp?=
 =?UTF-8?B?bCBbYW1kZ3B1XV0gKkVSUk9SKiBXYWl0aW5nIGZvciBmZW5jZXMgdGltZWQg?=
 =?UTF-8?B?b3V0IG9yIGludGVycnVwdGVkISBoYXBwZW5zIGV2ZXJ5IHRpbWUgd2hlbiBh?=
 =?UTF-8?B?INGBdXRzY2VuZSBzaG93ZWQgaW4gTWF4IFBheW5lIDM=?=
Date: Sat, 13 Jul 2019 22:47:08 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: mikhail.v.gavrilov@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111124-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0241045696=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0241045696==
Content-Type: multipart/alternative; boundary="15630580280.F78Db48A7.3430"
Content-Transfer-Encoding: 7bit


--15630580280.F78Db48A7.3430
Date: Sat, 13 Jul 2019 22:47:08 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111124

            Bug ID: 111124
           Summary: [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR*
                    Waiting for fences timed out or interrupted! happens
                    every time when a =D1=81utscene showed in Max Payne 3
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: mikhail.v.gavrilov@gmail.com

Created attachment 144775
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144775&action=3Dedit
save game should be placed in
".steam/steam/steamapps/compatdata/204100/pfx/drive_c/users/steamuser/My
Documents/Rockstar Games" directory

Here is a demonstration: https://youtu.be/5-peqm82_qI

Kernel: 5.3.0 commit 5450e8a316a6
Mesa: 19.2.0 commit f1e0a45d
libdrm: 2.4.99 commit 331e51e3
llvm: 8.0.0

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15630580280.F78Db48A7.3430
Date: Sat, 13 Jul 2019 22:47:08 +0000
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
   title=3D"NEW - [drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiti=
ng for fences timed out or interrupted! happens every time when a =D1=81uts=
cene showed in Max Payne 3"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111124">111124</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[drm:amdgpu_dm_atomic_commit_tail [amdgpu]] *ERROR* Waiting f=
or fences timed out or interrupted! happens every time when a =D1=81utscene=
 showed in Max Payne 3
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
          <td>Other
          </td>
        </tr>

        <tr>
          <th>OS</th>
          <td>All
          </td>
        </tr>

        <tr>
          <th>Status</th>
          <td>NEW
          </td>
        </tr>

        <tr>
          <th>Severity</th>
          <td>normal
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
          <td>mikhail.v.gavrilov&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144775=
" name=3D"attach_144775" title=3D"save game should be placed in &quot;.stea=
m/steam/steamapps/compatdata/204100/pfx/drive_c/users/steamuser/My Document=
s/Rockstar Games&quot; directory">attachment 144775</a> <a href=3D"attachme=
nt.cgi?id=3D144775&amp;action=3Dedit" title=3D"save game should be placed i=
n &quot;.steam/steam/steamapps/compatdata/204100/pfx/drive_c/users/steamuse=
r/My Documents/Rockstar Games&quot; directory">[details]</a></span>
save game should be placed in
&quot;.steam/steam/steamapps/compatdata/204100/pfx/drive_c/users/steamuser/=
My
Documents/Rockstar Games&quot; directory

Here is a demonstration: <a href=3D"https://youtu.be/5-peqm82_qI">https://y=
outu.be/5-peqm82_qI</a>

Kernel: 5.3.0 commit 5450e8a316a6
Mesa: 19.2.0 commit f1e0a45d
libdrm: 2.4.99 commit 331e51e3
llvm: 8.0.0</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15630580280.F78Db48A7.3430--

--===============0241045696==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0241045696==--
