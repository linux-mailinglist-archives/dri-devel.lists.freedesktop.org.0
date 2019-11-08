Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC443F529E
	for <lists+dri-devel@lfdr.de>; Fri,  8 Nov 2019 18:34:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C77E6FA34;
	Fri,  8 Nov 2019 17:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id E168F6FA34
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Nov 2019 17:34:36 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id DE6E0720E2; Fri,  8 Nov 2019 17:34:36 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 112235] [AMD tahiti xt] random crashes of GL/vulkan games
Date: Fri, 08 Nov 2019 17:34:37 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: critical
X-Bugzilla-Who: sylvain.bertrand@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-112235-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0760264590=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0760264590==
Content-Type: multipart/alternative; boundary="15732344760.f31Ec14.1214"
Content-Transfer-Encoding: 7bit


--15732344760.f31Ec14.1214
Date: Fri, 8 Nov 2019 17:34:36 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D112235

            Bug ID: 112235
           Summary: [AMD tahiti xt] random crashes of GL/vulkan games
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: critical
          Priority: not set
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: sylvain.bertrand@gmail.com

games started to randomly crash, vulkan or GL (dota2, dota2 underlord, CS:G=
O).

The only info I get from the crashes, are from dota2 vulkan (see kernel log)
and dota underlords.
This is a mesa vulkan debug build and the offset 0x1e08000 does not map to =
any
source code (glibc addr2line).

I cannot bisect correctly since some sessions have no crash at all for hour=
s.

Any ideas? (for the moment, I can update linux/drm/llvm/mesa/xserver every
week)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15732344760.f31Ec14.1214
Date: Fri, 8 Nov 2019 17:34:36 +0000
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
   title=3D"NEW - [AMD tahiti xt] random crashes of GL/vulkan games"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D112235">112235</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[AMD tahiti xt] random crashes of GL/vulkan games
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>DRI git
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
          <td>critical
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
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
          <td>sylvain.bertrand&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>games started to randomly crash, vulkan or GL (dota2, dota2 un=
derlord, CS:GO).

The only info I get from the crashes, are from dota2 vulkan (see kernel log)
and dota underlords.
This is a mesa vulkan debug build and the offset 0x1e08000 does not map to =
any
source code (glibc addr2line).

I cannot bisect correctly since some sessions have no crash at all for hour=
s.

Any ideas? (for the moment, I can update linux/drm/llvm/mesa/xserver every
week)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15732344760.f31Ec14.1214--

--===============0760264590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0760264590==--
