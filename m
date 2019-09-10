Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FB4CAF336
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 01:23:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB156E0CE;
	Tue, 10 Sep 2019 23:23:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id D78BC6E0CE
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 23:23:31 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id D4AA272167; Tue, 10 Sep 2019 23:23:31 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111634] HD4550 lockup when starting blender
Date: Tue, 10 Sep 2019 23:23:31 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/Radeon
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: not set
X-Bugzilla-Who: petrcvekcz@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: not set
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111634-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1729859957=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1729859957==
Content-Type: multipart/alternative; boundary="15681578111.72175.28756"
Content-Transfer-Encoding: 7bit


--15681578111.72175.28756
Date: Tue, 10 Sep 2019 23:23:31 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111634

            Bug ID: 111634
           Summary: HD4550 lockup when starting blender
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: not set
          Priority: not set
         Component: DRM/Radeon
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: petrcvekcz@gmail.com

Created attachment 145327
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145327&action=3Dedit
dmesg log from loading driver to blender start

Hello,

Starting the blender 2.81 on x86-64, xorg 1.20.5 and kernel 5.3.0-rc6-next =
will
cause a GPU lockup error (freeze, and after timeout GPU softreset).

Similar observation was made on mipsel debian sid (default blender and xorg
version, 5.3.0-rc6-next kernel) and mipsel buildroot (git snapshot blender,
last stable xorg, 5.3.0-rc6-next kernel).

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681578111.72175.28756
Date: Tue, 10 Sep 2019 23:23:31 +0000
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
   title=3D"NEW - HD4550 lockup when starting blender"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111634">111634</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HD4550 lockup when starting blender
          </td>
        </tr>

        <tr>
          <th>Product</th>
          <td>DRI
          </td>
        </tr>

        <tr>
          <th>Version</th>
          <td>unspecified
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
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Priority</th>
          <td>not set
          </td>
        </tr>

        <tr>
          <th>Component</th>
          <td>DRM/Radeon
          </td>
        </tr>

        <tr>
          <th>Assignee</th>
          <td>dri-devel&#64;lists.freedesktop.org
          </td>
        </tr>

        <tr>
          <th>Reporter</th>
          <td>petrcvekcz&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145327=
" name=3D"attach_145327" title=3D"dmesg log from loading driver to blender =
start">attachment 145327</a> <a href=3D"attachment.cgi?id=3D145327&amp;acti=
on=3Dedit" title=3D"dmesg log from loading driver to blender start">[detail=
s]</a></span>
dmesg log from loading driver to blender start

Hello,

Starting the blender 2.81 on x86-64, xorg 1.20.5 and kernel 5.3.0-rc6-next =
will
cause a GPU lockup error (freeze, and after timeout GPU softreset).

Similar observation was made on mipsel debian sid (default blender and xorg
version, 5.3.0-rc6-next kernel) and mipsel buildroot (git snapshot blender,
last stable xorg, 5.3.0-rc6-next kernel).</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681578111.72175.28756--

--===============1729859957==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1729859957==--
