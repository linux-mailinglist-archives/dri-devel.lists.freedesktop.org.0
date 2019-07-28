Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D086B7820C
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 00:21:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40C989AEA;
	Sun, 28 Jul 2019 22:21:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1B6A489AEA
 for <dri-devel@lists.freedesktop.org>; Sun, 28 Jul 2019 22:21:55 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 15B0072167; Sun, 28 Jul 2019 22:21:55 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 111243] Installation of 19.20 Fails
Date: Sun, 28 Jul 2019 22:21:55 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: Jacque8080@gmail.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
 attachments.created
Message-ID: <bug-111243-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0561248622=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0561248622==
Content-Type: multipart/alternative; boundary="15643525150.d1aCd4F1d.23502"
Content-Transfer-Encoding: 7bit


--15643525150.d1aCd4F1d.23502
Date: Sun, 28 Jul 2019 22:21:55 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D111243

            Bug ID: 111243
           Summary: Installation of 19.20 Fails
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: normal
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: Jacque8080@gmail.com

Created attachment 144899
  --> https://bugs.freedesktop.org/attachment.cgi?id=3D144899&action=3Dedit
Logs Recommended by AMD

deb [ trusted=3Dyes ] file:/var/opt/amdgpu-pro-local/ ./=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:1 file:/var/opt/amdgpu-pro-local ./ InRelease=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Ign:1 file:/var/opt/amdgpu-pro-local ./ InRelease=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:2 file:/var/opt/amdgpu-pro-local ./ Release [816 B]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:2 file:/var/opt/amdgpu-pro-local ./ Release [816 B]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:3 file:/var/opt/amdgpu-pro-local ./ Release.gpg=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Ign:3 file:/var/opt/amdgpu-pro-local ./ Release.gpg=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Hit:4 http://repo.steampowered.com/steam precise InRelease=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Hit:5 http://us.archive.ubuntu.com/ubuntu bionic InRelease=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:6 http://us.archive.ubuntu.com/ubuntu bionic-updates InRelease [88.7 kB=
]=20=20=20=20
Get:7 http://security.ubuntu.com/ubuntu bionic-security InRelease [88.7 kB]=
=20=20=20=20=20
Hit:8 http://ppa.launchpad.net/teejee2008/ppa/ubuntu bionic InRelease=20=20=
=20=20=20=20=20=20=20=20=20
Get:9 http://us.archive.ubuntu.com/ubuntu bionic-backports InRelease [74.6 =
kB]=20=20
Fetched 252 kB in 1s (294 kB/s)=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
Reading package lists... Done=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
Reading package lists... Done=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
Building dependency tree=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Reading state information... Done=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
amdgpu-pro-pin is already the newest version (19.20-812932).=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Selected version '19.20-812932' (localhost [all]) for 'amdgpu-pro-pin'=20=
=20=20=20=20=20=20=20=20=20
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
3 not fully installed or removed.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
After this operation, 0 B of additional disk space will be used.=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
Setting up libgl1-amdgpu-pro-ext-hwe:amd64 (19.20-812932) ...=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
ln: failed to create symbolic link
'/opt/amdgpu-pro/lib/xorg/modules/extensions/libglx.so': File e=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
xists=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
dpkg: error processing package libgl1-amdgpu-pro-ext-hwe:amd64 (--configure=
):=20=20=20
 installed libgl1-amdgpu-pro-ext-hwe:amd64 package post-installation script
subprocess returned er=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
ror exit status 1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
dpkg: dependency problems prevent configuration of amdgpu-pro-hwe:=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
 amdgpu-pro-hwe depends on libgl1-amdgpu-pro-ext-hwe (=3D 19.20-812932); ho=
wever:=20
  Package libgl1-amdgpu-pro-ext-hwe:amd64 is not configured yet.=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20

dpkg: error processing package amdgpu-pro-hwe (--configure):=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
 dependency problems - leaving unconfigured=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
dpkg: dependency problems prevent configuration of amdgpu-pro-lib32:=20=20=
=20=20=20=20=20=20=20=20=20=20
 amdgpu-pro-lib32 depends on amdgpu-pro (=3D 19.20-812932) | amdgpu-pro-hwe=
 (=3D
19.20-812932); howeve=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
r:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
  Package amdgpu-pro is not installed.=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
  Package amdgpu-pro-hwe is not configured yet.=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

dpkg: error processing package amdgpu-pro-lib32 (--configure):=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
 dependency problems - leaving unconfigured=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
No apport report written because the error message indicates its a followup
error from a previous=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
failure.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        No apport report written because the error message indicates its a
followup error from a p=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
revious failure.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                Errors were encountered while processing:=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
 libgl1-amdgpu-pro-ext-hwe:amd64=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
 amdgpu-pro-hwe=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
 amdgpu-pro-lib32=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
E: Sub-process /usr/bin/dpkg returned an error code (1)

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15643525150.d1aCd4F1d.23502
Date: Sun, 28 Jul 2019 22:21:55 +0000
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
   title=3D"NEW - Installation of 19.20 Fails"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D111243">111243</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Installation of 19.20 Fails
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
          <td>Jacque8080&#64;gmail.com
          </td>
        </tr></table>
      <p>
        <div>
        <pre>Created <span class=3D""><a href=3D"attachment.cgi?id=3D144899=
" name=3D"attach_144899" title=3D"Logs Recommended by AMD">attachment 14489=
9</a> <a href=3D"attachment.cgi?id=3D144899&amp;action=3Dedit" title=3D"Log=
s Recommended by AMD">[details]</a></span>
Logs Recommended by AMD

deb [ trusted=3Dyes ] file:/var/opt/amdgpu-pro-local/ ./=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:1 file:/var/opt/amdgpu-pro-local ./ InRelease=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Ign:1 file:/var/opt/amdgpu-pro-local ./ InRelease=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:2 file:/var/opt/amdgpu-pro-local ./ Release [816 B]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:2 file:/var/opt/amdgpu-pro-local ./ Release [816 B]=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Get:3 file:/var/opt/amdgpu-pro-local ./ Release.gpg=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Ign:3 file:/var/opt/amdgpu-pro-local ./ Release.gpg=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Hit:4 <a href=3D"http://repo.steampowered.com/steam">http://repo.steampower=
ed.com/steam</a> precise InRelease=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
Hit:5 <a href=3D"http://us.archive.ubuntu.com/ubuntu">http://us.archive.ubu=
ntu.com/ubuntu</a> bionic InRelease=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
Get:6 <a href=3D"http://us.archive.ubuntu.com/ubuntu">http://us.archive.ubu=
ntu.com/ubuntu</a> bionic-updates InRelease [88.7 kB]=20=20=20=20
Get:7 <a href=3D"http://security.ubuntu.com/ubuntu">http://security.ubuntu.=
com/ubuntu</a> bionic-security InRelease [88.7 kB]=20=20=20=20=20
Hit:8 <a href=3D"http://ppa.launchpad.net/teejee2008/ppa/ubuntu">http://ppa=
.launchpad.net/teejee2008/ppa/ubuntu</a> bionic InRelease=20=20=20=20=20=20=
=20=20=20=20=20
Get:9 <a href=3D"http://us.archive.ubuntu.com/ubuntu">http://us.archive.ubu=
ntu.com/ubuntu</a> bionic-backports InRelease [74.6 kB]=20=20
Fetched 252 kB in 1s (294 kB/s)=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20
Reading package lists... Done=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
Reading package lists... Done=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
Building dependency tree=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Reading state information... Done=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
amdgpu-pro-pin is already the newest version (19.20-812932).=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
Selected version '19.20-812932' (localhost [all]) for 'amdgpu-pro-pin'=20=
=20=20=20=20=20=20=20=20=20
0 upgraded, 0 newly installed, 0 to remove and 0 not upgraded.=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
3 not fully installed or removed.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20
After this operation, 0 B of additional disk space will be used.=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
Setting up libgl1-amdgpu-pro-ext-hwe:amd64 (19.20-812932) ...=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
ln: failed to create symbolic link
'/opt/amdgpu-pro/lib/xorg/modules/extensions/libglx.so': File e=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20
xists=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
dpkg: error processing package libgl1-amdgpu-pro-ext-hwe:amd64 (--configure=
):=20=20=20
 installed libgl1-amdgpu-pro-ext-hwe:amd64 package post-installation script
subprocess returned er=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
ror exit status 1=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
dpkg: dependency problems prevent configuration of amdgpu-pro-hwe:=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20
 amdgpu-pro-hwe depends on libgl1-amdgpu-pro-ext-hwe (=3D 19.20-812932); ho=
wever:=20
  Package libgl1-amdgpu-pro-ext-hwe:amd64 is not configured yet.=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20

dpkg: error processing package amdgpu-pro-hwe (--configure):=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
 dependency problems - leaving unconfigured=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
dpkg: dependency problems prevent configuration of amdgpu-pro-lib32:=20=20=
=20=20=20=20=20=20=20=20=20=20
 amdgpu-pro-lib32 depends on amdgpu-pro (=3D 19.20-812932) | amdgpu-pro-hwe=
 (=3D
19.20-812932); howeve=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
r:=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20
  Package amdgpu-pro is not installed.=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20
  Package amdgpu-pro-hwe is not configured yet.=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20

dpkg: error processing package amdgpu-pro-lib32 (--configure):=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20
 dependency problems - leaving unconfigured=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20
No apport report written because the error message indicates its a followup
error from a previous=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
failure.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
        No apport report written because the error message indicates its a
followup error from a p=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
revious failure.=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
                Errors were encountered while processing:=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
 libgl1-amdgpu-pro-ext-hwe:amd64=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20
 amdgpu-pro-hwe=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
 amdgpu-pro-lib32=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=
=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20=20
E: Sub-process /usr/bin/dpkg returned an error code (1)</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15643525150.d1aCd4F1d.23502--

--===============0561248622==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0561248622==--
