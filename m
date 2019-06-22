Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E37B4F334
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 04:27:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E89E6E94E;
	Sat, 22 Jun 2019 02:27:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 789796E94E
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 02:27:09 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 6DD3F72167; Sat, 22 Jun 2019 02:27:09 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110960] Non-existent alternative dependencies in some deb
 packages
Date: Sat, 22 Jun 2019 02:27:09 +0000
X-Bugzilla-Reason: AssignedTo
X-Bugzilla-Type: new
X-Bugzilla-Watch-Reason: None
X-Bugzilla-Product: DRI
X-Bugzilla-Component: DRM/AMDgpu-pro
X-Bugzilla-Version: unspecified
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: trivial
X-Bugzilla-Who: ashark@linuxcomp.ru
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: medium
X-Bugzilla-Assigned-To: dri-devel@lists.freedesktop.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: bug_id short_desc product version rep_platform
 op_sys bug_status bug_severity priority component assigned_to reporter
Message-ID: <bug-110960-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============1428640893=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1428640893==
Content-Type: multipart/alternative; boundary="15611704290.cE6d9D87A.25052"
Content-Transfer-Encoding: 7bit


--15611704290.cE6d9D87A.25052
Date: Sat, 22 Jun 2019 02:27:09 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110960

            Bug ID: 110960
           Summary: Non-existent alternative dependencies in some deb
                    packages
           Product: DRI
           Version: unspecified
          Hardware: Other
                OS: All
            Status: NEW
          Severity: trivial
          Priority: medium
         Component: DRM/AMDgpu-pro
          Assignee: dri-devel@lists.freedesktop.org
          Reporter: ashark@linuxcomp.ru

19.20-812932 release for Ubuntu
mesa-amdgpu-va-drivers_18.3.0-812932_amd64.deb and
mesa-amdgpu-va-drivers_18.3.0-812932_i386.deb have such dependencies:
libva1-amdgpu | libva2-amdgpu | libva1 | libva2

mesa-amdgpu-vdpau-drivers_18.3.0-812932_amd64.deb and
mesa-amdgpu-vdpau-drivers_18.3.0-812932_i386.deb have such:
libvdpau1-amdgpu | libvdpau1

But libva1-amdgpu, libva2-amdgpu, libvdpau1-amdgpu do not exist neither in
ubuntu repos, nor provided by bundled archive.

Is there any special intent to add such alternative dependencies?

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15611704290.cE6d9D87A.25052
Date: Sat, 22 Jun 2019 02:27:09 +0000
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
   title=3D"NEW - Non-existent alternative dependencies in some deb package=
s"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110960">110960</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Non-existent alternative dependencies in some deb packages
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
          <td>trivial
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
          <td>ashark&#64;linuxcomp.ru
          </td>
        </tr></table>
      <p>
        <div>
        <pre>19.20-812932 release for Ubuntu
mesa-amdgpu-va-drivers_18.3.0-812932_amd64.deb and
mesa-amdgpu-va-drivers_18.3.0-812932_i386.deb have such dependencies:
libva1-amdgpu | libva2-amdgpu | libva1 | libva2

mesa-amdgpu-vdpau-drivers_18.3.0-812932_amd64.deb and
mesa-amdgpu-vdpau-drivers_18.3.0-812932_i386.deb have such:
libvdpau1-amdgpu | libvdpau1

But libva1-amdgpu, libva2-amdgpu, libvdpau1-amdgpu do not exist neither in
ubuntu repos, nor provided by bundled archive.

Is there any special intent to add such alternative dependencies?</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15611704290.cE6d9D87A.25052--

--===============1428640893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============1428640893==--
