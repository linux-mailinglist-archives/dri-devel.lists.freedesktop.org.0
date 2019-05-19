Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B04322856
	for <lists+dri-devel@lfdr.de>; Sun, 19 May 2019 20:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C96BF891B1;
	Sun, 19 May 2019 18:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id F1583891B1
 for <dri-devel@lists.freedesktop.org>; Sun, 19 May 2019 18:35:42 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id E824D72167; Sun, 19 May 2019 18:35:42 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110712] [regression]Raven Ridge: System freeze but mouse cursor
 able to move when using Firefox Webrender.
Date: Sun, 19 May 2019 18:35:43 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: haxk612@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110712-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0659530102=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0659530102==
Content-Type: multipart/alternative; boundary="15582909420.a7A5.5045"
Content-Transfer-Encoding: 7bit


--15582909420.a7A5.5045
Date: Sun, 19 May 2019 18:35:42 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110712

            Bug ID: 110712
           Summary: [regression]Raven Ridge: System freeze but mouse
                    cursor able to move when using Firefox Webrender.
           Product: DRI
           Version: XOrg git
          Hardware: Other
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: haxk612@gmail.com

System: Arch Linux
Kernel: Git (72cf0b07418a9c8349aa9137194b1ccba6e54a9d)
MESA version (19.2-4689e98f)

When using Firefox Webrender and browsing some heavy site the system freezes
but mouse cursor is still able to move as normal.

This wasnt an issue on my last build of MESA (db329260bff) and once i build=
 new
version the system started to freeze.

As a temporary workaround im using my last build thats working but this is =
not
an OK solution for obvious reasons.

I found bug 108718 which is the same as this one but nobody responded to it=
 and
i think it got solved as the reporter didnt respond to it anymore thus i th=
ink
this is an regression.

Im unable to provide dmesg of the issue as when the system locks up i cannot
even go to TTY.
Will try to set up SSH and capture dmesg like that.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15582909420.a7A5.5045
Date: Sun, 19 May 2019 18:35:42 +0000
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
   title=3D"NEW - [regression]Raven Ridge: System freeze but mouse cursor a=
ble to move when using Firefox Webrender."
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110712">110712</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[regression]Raven Ridge: System freeze but mouse cursor able =
to move when using Firefox Webrender.
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
          <td>major
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
          <td>haxk612&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>System: Arch Linux
Kernel: Git (72cf0b07418a9c8349aa9137194b1ccba6e54a9d)
MESA version (19.2-4689e98f)

When using Firefox Webrender and browsing some heavy site the system freezes
but mouse cursor is still able to move as normal.

This wasnt an issue on my last build of MESA (db329260bff) and once i build=
 new
version the system started to freeze.

As a temporary workaround im using my last build thats working but this is =
not
an OK solution for obvious reasons.

I found <a class=3D"bz_bug_link=20
          bz_status_NEW "
   title=3D"NEW - Raven Ridge: ring sdma0 timeout on heavy CSS website with=
 Firefox WebRender"
   href=3D"show_bug.cgi?id=3D108718">bug 108718</a> which is the same as th=
is one but nobody responded to it and
i think it got solved as the reporter didnt respond to it anymore thus i th=
ink
this is an regression.

Im unable to provide dmesg of the issue as when the system locks up i cannot
even go to TTY.
Will try to set up SSH and capture dmesg like that.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15582909420.a7A5.5045--

--===============0659530102==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0659530102==--
