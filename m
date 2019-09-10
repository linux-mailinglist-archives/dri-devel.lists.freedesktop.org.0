Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41A2CAF367
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2019 01:37:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E28E6E9DC;
	Tue, 10 Sep 2019 23:37:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id B18936E9DC
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Sep 2019 23:37:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id AE27C72167; Tue, 10 Sep 2019 23:37:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111635] HD4550 fails to complete tests (radeon.test=2)
Date: Tue, 10 Sep 2019 23:37:10 +0000
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
Message-ID: <bug-111635-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0126585327=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0126585327==
Content-Type: multipart/alternative; boundary="15681586300.b61DB9bD7.31817"
Content-Transfer-Encoding: 7bit


--15681586300.b61DB9bD7.31817
Date: Tue, 10 Sep 2019 23:37:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111635

            Bug ID: 111635
           Summary: HD4550 fails to complete tests (radeon.test=3D2)
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

Created attachment 145328
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D145328&action=3Dedit
dmesg for radeon.test=3D2

Booting with parameter radeon.test=3D2 will cause the radeon driver's tests=
 to
fail.

Observed kernel versions: 5.3.0-rc6-next and 4.19.71
Observed on mipsel too, kernel 5.3.0-rc6-next

There is a possibility this is related to bug 111634 (same card, same kernel
...)=20

https://bugs.freedesktop.org/show_bug.cgi?id=3D111634

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15681586300.b61DB9bD7.31817
Date: Tue, 10 Sep 2019 23:37:10 +0000
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
   title=3D"NEW - HD4550 fails to complete tests (radeon.test=3D2)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111635">111635</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>HD4550 fails to complete tests (radeon.test=3D2)
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
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D145328=
" name=3D"attach_145328" title=3D"dmesg for radeon.test=3D2">attachment 145=
328</a> <a href=3D"attachment.cgi?id=3D145328&amp;action=3Dedit" title=3D"d=
mesg for radeon.test=3D2">[details]</a></span>
dmesg for radeon.test=3D2

Booting with parameter radeon.test=3D2 will cause the radeon driver's tests=
 to
fail.

Observed kernel versions: 5.3.0-rc6-next and 4.19.71
Observed on mipsel too, kernel 5.3.0-rc6-next

There is a possibility this is related to <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HD4550 lockup when starting blender"
   href=3D"show_bug.cgi?id=3D111634">bug 111634</a> (same card, same kernel
...)=20

<a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - HD4550 lockup when starting blender"
   href=3D"show_bug.cgi?id=3D111634">https://bugs.freedesktop.org/show_bug.=
cgi?id=3D111634</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15681586300.b61DB9bD7.31817--

--===============0126585327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0126585327==--
