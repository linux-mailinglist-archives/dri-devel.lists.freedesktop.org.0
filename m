Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E96E454EFA
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 14:36:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 359706E0EE;
	Tue, 25 Jun 2019 12:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:fe98:4b55])
 by gabe.freedesktop.org (Postfix) with ESMTP id 685726E0EE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2019 12:36:07 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6071272167; Tue, 25 Jun 2019 12:36:07 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110994] [vega10] *ERROR* Failed to initialize parser -125! ,
 running libreoffice
Date: Tue, 25 Jun 2019 12:36:07 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu
X-Bugzilla-Version: DRI git
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: tomenglund26@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110994-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1300913453=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1300913453==
Content-Type: multipart/alternative; boundary="15614661670.adfC.6529"
Content-Transfer-Encoding: 7bit


--15614661670.adfC.6529
Date: Tue, 25 Jun 2019 12:36:07 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110994

            Bug ID: 110994
           Summary: [vega10] *ERROR* Failed to initialize parser -125! ,
                    running libreoffice
           Product: DRI
           Version: DRI git
          Hardware: x86-64 (AMD64)
                OS: Linux (All)
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: tomenglund26@gmail.com

when running libreoffice 6.3.0.0beta1-1 everything freezes and shows a blur=
red
screen.

and this starts spamming in the journal.

jun 25 14:25:30 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:30 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:30 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:30 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:30 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:30 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:31 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:31 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:31 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:31 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:31 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:31 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.


sx is the bash script launching my window manager. instead of "startx" and i
have its output piped into systemd journal.

systeminfo:

libdrm-git 2.4.98.r33.g08bd098d-1
xf86-video-amdgpu-git 19.0.1.5-1
llvm-git 9.0.0_r319552.a4876282704-1
mesa-git 19.2.0_devel.112106.188dbb1679b-1
linux-zen 5.1.12.zen1-1

amd vega 56

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15614661670.adfC.6529
Date: Tue, 25 Jun 2019 12:36:07 +0000
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
   title=3D"NEW - [vega10] *ERROR* Failed to initialize parser -125! , runn=
ing libreoffice"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110994">110994</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>[vega10] *ERROR* Failed to initialize parser -125! , running =
libreoffice
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
          <td>tomenglund26&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>when running libreoffice 6.3.0.0beta1-1 everything freezes and=
 shows a blurred
screen.

and this starts spamming in the journal.

jun 25 14:25:30 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:30 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:30 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:30 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:30 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:30 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:31 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:31 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:31 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:31 tom-pc kernel: [drm:amdgpu_cs_ioctl [amdgpu]] *ERROR* Faile=
d to
initialize parser -125!
jun 25 14:25:31 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.
jun 25 14:25:31 tom-pc sx[662]: amdgpu: The CS has been cancelled because t=
he
context is lost.


sx is the bash script launching my window manager. instead of &quot;startx&=
quot; and i
have its output piped into systemd journal.

systeminfo:

libdrm-git 2.4.98.r33.g08bd098d-1
xf86-video-amdgpu-git 19.0.1.5-1
llvm-git 9.0.0_r319552.a4876282704-1
mesa-git 19.2.0_devel.112106.188dbb1679b-1
linux-zen 5.1.12.zen1-1

amd vega 56</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15614661670.adfC.6529--

--===============1300913453==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1300913453==--
