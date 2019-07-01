Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D81B4F37A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Jun 2019 06:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 991216E952;
	Sat, 22 Jun 2019 04:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from culpepper.freedesktop.org (culpepper.freedesktop.org
 [131.252.210.165])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0BDE06E952
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2019 04:06:25 +0000 (UTC)
Received: by culpepper.freedesktop.org (Postfix, from userid 33)
 id 08F3072168; Sat, 22 Jun 2019 04:06:24 +0000 (UTC)
From: bugzilla-daemon@freedesktop.org
To: dri-devel@lists.freedesktop.org
Subject: [Bug 110966] Documentation update about required lunar sdk
Date: Sat, 22 Jun 2019 04:06:24 +0000
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
Message-ID: <bug-110966-502@http.bugs.freedesktop.org/>
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
Content-Type: multipart/mixed; boundary="===============0149579496=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0149579496==
Content-Type: multipart/alternative; boundary="15611763831.553DC99.7858"
Content-Transfer-Encoding: 7bit


--15611763831.553DC99.7858
Date: Sat, 22 Jun 2019 04:06:23 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bugzilla-URL: http://bugs.freedesktop.org/
Auto-Submitted: auto-generated

https://bugs.freedesktop.org/show_bug.cgi?id=3D110966

            Bug ID: 110966
           Summary: Documentation update about required lunar sdk
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

Release page
https://www.amd.com/en/support/kb/release-notes/rn-rad-lin-19-20-unified sa=
ys:
To use the Vulkan driver in this stack, Vulkan SDK version v1.1.106.0 needs=
 to
be installed. The SDK can be downloaded from:
https://vulkan.lunarg.com/sdk/home

But in 19.20-812932 release for Ubuntu in
vulkan-amdgpu-pro_19.20-812932_amd64.deb in
opt/amdgpu-pro/etc/vulkan/icd.d/amd_icd64.json I can see:
"api_version" : "1.1.108"

So I guess that it may require a newer version.

And is it even required? In Arch Linux there was a package created for this
https://aur.archlinux.org/packages/lunarg-vulkan-sdk/ and I am wondering if
that should be deleted.

--=20
You are receiving this mail because:
You are the assignee for the bug.=

--15611763831.553DC99.7858
Date: Sat, 22 Jun 2019 04:06:23 +0000
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
   title=3D"NEW - Documentation update about required lunar sdk"
   href=3D"https://bugs.freedesktop.org/show_bug.cgi?id=3D110966">110966</a>
          </td>
        </tr>

        <tr>
          <th>Summary</th>
          <td>Documentation update about required lunar sdk
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
        <pre>Release page
<a href=3D"https://www.amd.com/en/support/kb/release-notes/rn-rad-lin-19-20=
-unified">https://www.amd.com/en/support/kb/release-notes/rn-rad-lin-19-20-=
unified</a> says:
To use the Vulkan driver in this stack, Vulkan SDK version v1.1.106.0 needs=
 to
be installed. The SDK can be downloaded from:
<a href=3D"https://vulkan.lunarg.com/sdk/home">https://vulkan.lunarg.com/sd=
k/home</a>

But in 19.20-812932 release for Ubuntu in
vulkan-amdgpu-pro_19.20-812932_amd64.deb in
opt/amdgpu-pro/etc/vulkan/icd.d/amd_icd64.json I can see:
&quot;api_version&quot; : &quot;1.1.108&quot;

So I guess that it may require a newer version.

And is it even required? In Arch Linux there was a package created for this
<a href=3D"https://aur.archlinux.org/packages/lunarg-vulkan-sdk/">https://a=
ur.archlinux.org/packages/lunarg-vulkan-sdk/</a> and I am wondering if
that should be deleted.</pre>
        </div>
      </p>


      <hr>
      <span>You are receiving this mail because:</span>

      <ul>
          <li>You are the assignee for the bug.</li>
      </ul>
    </body>
</html>=

--15611763831.553DC99.7858--

--===============0149579496==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0149579496==--
