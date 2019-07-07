Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 04304617BC
	for <lists+dri-devel@lfdr.de>; Sun,  7 Jul 2019 23:45:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 864AC895B9;
	Sun,  7 Jul 2019 21:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 24FB3895B9
 for <dri-devel@lists.freedesktop.org>; Sun,  7 Jul 2019 21:45:28 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 214A272167; Sun,  7 Jul 2019 21:45:28 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111081] OS Fails to Boot to Runlevel 5
Date: Sun, 07 Jul 2019 21:45:28 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: blocker
X-Bugzilla-Who: nat.admin@inventati.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111081-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1588825457=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1588825457==
Content-Type: multipart/alternative; boundary="15625359280.6Eb0B.8055"
Content-Transfer-Encoding: 7bit


--15625359280.6Eb0B.8055
Date: Sun, 7 Jul 2019 21:45:28 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111081

            Bug ID: 111081
           Summary: OS Fails to Boot to Runlevel 5
           Product: DRI
           Version: unspecified
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: blocker
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: nat.admin@inventati.org

Created attachment 144717
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144717&action=3Dedit
Basic Configurate

After installing, AMD GPU pro driver 19.2 on Ubuntu 18.04 I cannot reboot.T=
his
is a fresh install. I only ran update, upgrade then rebooted then install
driver 19.2. I have reproduced the problem about 3 times. When booting in
verbose mode, I noticed the computer always reaches runlevel 3.

The I followed the bug reporting procedures from
https://amdgpu-install.readthedocs.io/en/latest/install-bugrep.html#generat=
ing-a-bug-report
twice. Once after installing the driver, but before rebooting, and once aft=
er
rebooting. However, I do not see how to attach all the files.=20

In order to reboot I had to downgrade to a previous kernel.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15625359280.6Eb0B.8055
Date: Sun, 7 Jul 2019 21:45:28 +0000
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
   title=3D"NEW - OS Fails to Boot to Runlevel 5"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111081">111081</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>OS Fails to Boot to Runlevel 5
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
          <td>nat.admin&#64;inventati.org
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144717=
" name=3D"attach_144717" title=3D"Basic Configurate">attachment 144717</a> =
<a href=3D"attachment.cgi?id=3D144717&amp;action=3Dedit" title=3D"Basic Con=
figurate">[details]</a></span>
Basic Configurate

After installing, AMD GPU pro driver 19.2 on Ubuntu 18.04 I cannot reboot.T=
his
is a fresh install. I only ran update, upgrade then rebooted then install
driver 19.2. I have reproduced the problem about 3 times. When booting in
verbose mode, I noticed the computer always reaches runlevel 3.

The I followed the bug reporting procedures from
<a href=3D"https://amdgpu-install.readthedocs.io/en/latest/install-bugrep.h=
tml#generating-a-bug-report">https://amdgpu-install.readthedocs.io/en/lates=
t/install-bugrep.html#generating-a-bug-report</a>
twice. Once after installing the driver, but before rebooting, and once aft=
er
rebooting. However, I do not see how to attach all the files.=20

In order to reboot I had to downgrade to a previous kernel.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15625359280.6Eb0B.8055--

--===============1588825457==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1588825457==--
