Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4012E81A57
	for <lists+dri-devel@lfdr.de>; Mon,  5 Aug 2019 15:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13E4789CF6;
	Mon,  5 Aug 2019 13:05:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 48CBD89CF6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Aug 2019 13:05:10 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 3BE8F72167; Mon,  5 Aug 2019 13:05:10 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111299] AMD RX 570 Black Screen/Hang at startup (AMDGpu DC
 problem)
Date: Mon, 05 Aug 2019 13:05:10 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: XOrg git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: major
X-Bugzilla-Who: suren.karimp@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-111299-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1334523184=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1334523184==
Content-Type: multipart/alternative; boundary="15650103100.7C0d.29003"
Content-Transfer-Encoding: 7bit


--15650103100.7C0d.29003
Date: Mon, 5 Aug 2019 13:05:10 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111299

            Bug ID: 111299
           Summary: AMD RX 570 Black Screen/Hang at startup (AMDGpu DC
                    problem)
           Product: DRI
           Version: XOrg git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: major
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: suren.karimp@gmail.com

Hello, AMD RX 570 faces a blank, black screen at boot. This started happeni=
ng
after linux kernel 4.17 started enabling amdgpu DC by default, and only
solution (for now) is disabling amdgpu DC using amdgpu.dc=3D0 kernel boot
parameter.

Here is like to original bug, in Ubuntu's tracker:
https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-amdgpu/+bug/18=
37945

Sytem information (inxi -SGxxx): https://paste.ubuntu.com/p/sWW27FBwCG/

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15650103100.7C0d.29003
Date: Mon, 5 Aug 2019 13:05:10 +0000
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
   title=3D"NEW - AMD RX 570 Black Screen/Hang at startup (AMDGpu DC proble=
m)"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111299">111299</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>AMD RX 570 Black Screen/Hang at startup (AMDGpu DC problem)
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
          <td>suren.karimp&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Hello, AMD RX 570 faces a blank, black screen at boot. This st=
arted happening
after linux kernel 4.17 started enabling amdgpu DC by default, and only
solution (for now) is disabling amdgpu DC using amdgpu.dc=3D0 kernel boot
parameter.

Here is like to original bug, in Ubuntu's tracker:
<a href=3D"https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-video-amd=
gpu/+bug/1837945">https://bugs.launchpad.net/ubuntu/+source/xserver-xorg-vi=
deo-amdgpu/+bug/1837945</a>

Sytem information (inxi -SGxxx): <a href=3D"https://paste.ubuntu.com/p/sWW2=
7FBwCG/">https://paste.ubuntu.com/p/sWW27FBwCG/</a></pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15650103100.7C0d.29003--

--===============1334523184==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1334523184==--
